import 'package:dig_mobile_app/app/cubit/recovery_phrase/recovery_phrase_cubit.dart';
import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_check_box.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/viewmodel/recovery_phrase_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecoveryPhrasePage extends StatefulWidget {
  final String mnemonic;

  const RecoveryPhrasePage({required this.mnemonic, Key? key})
      : super(key: key);

  @override
  State<RecoveryPhrasePage> createState() => _RecoveryPhrasePageState();
}

class _RecoveryPhrasePageState extends State<RecoveryPhrasePage> {
  final RecoveryPhraseCubit _cubit = di();

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
                child: BlocConsumer<RecoveryPhraseCubit, RecoveryPhraseState>(
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

  void _cubitListener(_, RecoveryPhraseState state) {}

  Widget _buildBody(RecoveryPhraseViewModel model) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.your_recovery_phrase,
                    style: DSTextStyle.tsMontserratT20B
                        .copyWith(color: DSColors.tulipTree),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(S.current.your_recovery_phrase_description,
                        style: DSTextStyle.tsMontserratT12R
                            .copyWith(color: Colors.white)),
                  ),
                  _buildRecoveryPhraseGrid(model),
                  const SizedBox(
                    height: 20,
                  ),
                  _CopyToClipBoard(
                    onTap: () => _cubit.copyToClipboard(widget.mnemonic),
                    isCopied: model.isCopiedToClipboard,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DSCheckBox(
                          onChanged: (isChecked) =>
                              _cubit.onCheckBoxClicked(isChecked),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            S.current.confirm_backup_recovery_phrase,
                            style: DSTextStyle.tsMontserratT12R
                                .copyWith(color: Colors.white),
                          ),
                        )
                      ],
                    ),
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
                Navigator.of(context).pushNamed(
                    DigPageName.confirmRecoveryPhrase,
                    arguments: widget.mnemonic);
              }),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildRecoveryPhraseGrid(RecoveryPhraseViewModel model) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
        itemCount: model.mnemonics.length,
        physics: const NeverScrollableScrollPhysics(),
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
            index: index + 1,
            text: model.mnemonics[index],
          );
        },
      ),
    );
  }
}

class _PhraseGridItem extends StatelessWidget {
  final int index;
  final String text;

  const _PhraseGridItem({required this.text, this.index = 0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                  color: DSColors.tulipTree, shape: BoxShape.circle),
              child: Center(
                  child: Text(
                index.toString(),
                style:
                    DSTextStyle.tsMontserratT10R.copyWith(color: Colors.black),
              )),
            ),
          ),
          Expanded(
            child: Text(text,
                maxLines: 1,
                style:
                    DSTextStyle.tsMontserratT10R.copyWith(color: Colors.black)),
          )
        ],
      ),
    );
  }
}

class _CopyToClipBoard extends StatelessWidget {
  final bool isCopied;
  final Function? onTap;

  const _CopyToClipBoard({this.isCopied = false, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isCopied)
            SvgPicture.asset(
              AppAssets.icCopied,
              width: 16,
              height: 16,
            )
          else
            const Icon(
              Icons.copy,
              size: 16,
              color: DSColors.tulipTree,
            ),
          const SizedBox(
            width: 6,
          ),
          Text(
            isCopied
                ? S.current.copied_to_clipboard
                : S.current.copy_to_clipboard,
            style: DSTextStyle.tsMontserratT16M.copyWith(
                color: isCopied ? DSColors.jungleGreen : DSColors.tulipTree),
          )
        ],
      ),
    );
  }
}
