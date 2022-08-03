import 'package:dig_mobile_app/app/cubit/confirm_recovery_phrase/confirm_recovery_phrase_cubit.dart';
import 'package:dig_mobile_app/app/cubit/confirm_recovery_phrase/confirm_recovery_phrase_data_item.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/viewmodel/confirm_recovery_phrase_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmRecoveryPhrase extends StatefulWidget {
  final String mnemonic;

  const ConfirmRecoveryPhrase({required this.mnemonic, Key? key})
      : super(key: key);

  @override
  State<ConfirmRecoveryPhrase> createState() => _ConfirmRecoveryPhraseState();
}

class _ConfirmRecoveryPhraseState extends State<ConfirmRecoveryPhrase> {
  final ConfirmRecoveryPhraseCubit _cubit = di();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.init(widget.mnemonic);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          body: DSBackground(
        child: SafeArea(
          child: Column(
            children: [
              DSPrimaryAppBar.normal(
                onBackButtonPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: BlocConsumer<ConfirmRecoveryPhraseCubit,
                    ConfirmRecoveryPhraseState>(
                  bloc: _cubit,
                  listener: _cubitListener,
                  builder: (context, state) => _buildBody(state.model),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  void _cubitListener(_, state) {}

  Widget _buildBody(ConfirmRecoveryPhraseViewModel model) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    S.current.confirm_recovery_phrase,
                    style: DSTextStyle.tsMontserratT20B
                        .copyWith(color: DSColors.tulipTree),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: _buildConfirmResultGrid(model),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  _buildSelectGrid(model),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          DSPrimaryButton(
              title: S.current.continue_text,
              enable: model.canContinue,
              onTap: () {
                Navigator.of(context).pushNamed(DigPageName.nameAccount,
                    arguments: widget.mnemonic);
              }),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildConfirmResultGrid(ConfirmRecoveryPhraseViewModel model) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: model.confirmResults.length,
      padding: const EdgeInsets.all(6),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / .4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _ConfirmResultGridItem(
          onTap: (word) => _cubit.unSelectWord(word),
          index: index + 1,
          text: model.confirmResults[index],
        );
      },
    );
  }

  Widget _buildSelectGrid(ConfirmRecoveryPhraseViewModel model) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model.selectItems.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 14,
        childAspectRatio: 1 / .4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _PhraseGridItem(
          onTap: (data) => _cubit.selectWord(data),
          data: model.selectItems[index],
        );
      },
    );
  }
}

class _PhraseGridItem extends StatelessWidget {
  final ConfirmRecoveryPhraseDataItem data;
  final Function(ConfirmRecoveryPhraseDataItem)? onTap;

  const _PhraseGridItem({required this.data, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Center(
        child: Text(
      data.isSelected ? '' : data.word,
      style: DSTextStyle.tsMontserratT10R.copyWith(color: DSColors.tulipTree),
    ));
    return GestureDetector(
      onTap: () => onTap?.call(data),
      behavior: HitTestBehavior.opaque,
      child: data.isSelected
          ? _buildDottedBorderContainer(child)
          : _buildRoundedContainer(child),
    );
  }

  Widget _buildDottedBorderContainer(Widget child) {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: const [3, 4],
      radius: const Radius.circular(5),
      color: DSColors.tulipTree,
      child: child,
    );
  }

  Widget _buildRoundedContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: DSColors.tulipTree)),
      child: child,
    );
  }
}

class _ConfirmResultGridItem extends StatelessWidget {
  final int index;
  final String text;
  final Function(String)? onTap;

  const _ConfirmResultGridItem(
      {required this.text, this.index = 0, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(text),
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
            color: DSColors.tundora, borderRadius: BorderRadius.circular(5)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  index.toString(),
                  style: DSTextStyle.tsMontserratT10R
                      .copyWith(color: Colors.black),
                )),
              ),
            ),
            Expanded(
              child: Text(text,
                  maxLines: 1,
                  style: DSTextStyle.tsMontserratT10R
                      .copyWith(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
