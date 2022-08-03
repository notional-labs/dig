import 'package:dig_mobile_app/app/cubit/proposal/create_proposal/create_proposal_cubit.dart';
import 'package:dig_mobile_app/app/definition/regex.dart';
import 'package:dig_mobile_app/app/designsystem/ds_check_box.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_small_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_field.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/designsystem/ds_textfield_dropdown_widget.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/create_proposal_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProposalWidgetParam {
  const CreateProposalWidgetParam();
}

class CreateProposalWidget extends StatefulWidget {
  final CreateProposalWidgetParam param;

  const CreateProposalWidget({required this.param, Key? key}) : super(key: key);

  @override
  State<CreateProposalWidget> createState() => _CreateProposalWidgetState();
}

class _CreateProposalWidgetState extends State<CreateProposalWidget>
    with WidgetUtil {
  final CreateProposalCubit _cubit = di();
  final DSTextFieldDropdownController _dropdownController =
      DSTextFieldDropdownController();

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: BlocConsumer<CreateProposalCubit, CreateProposalState>(
            bloc: _cubit,
            listener: _onBlocListener,
            builder: (_, CreateProposalState state) =>
                _buildScrollableWidget(state.viewModel)),
      );

  void _onBlocListener(BuildContext context, CreateProposalState state) {}

  Widget _buildScrollableWidget(CreateProposalViewModel viewModel) =>
      GestureDetector(
        onTap: () {
          _cubit.closeEvent();
        },
        child: Container(
          height: double.infinity,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: _buildBodyWidget(viewModel),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 5)
            ],
          ),
        ),
      );

  Widget _buildBodyWidget(CreateProposalViewModel viewModel) {
    final textFieldHeight = 30.0;
    final textFieldContentPadding = const EdgeInsets.all(6);
    return GestureDetector(
        onTap: () {
          closeGlobalKeyboard();
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: DSColors.tundora,
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 18),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.create_proposal,
                    style: DSTextStyle.tsMontserratT20B
                        .copyWith(color: DSColors.tulipTree),
                  ),
                  const SizedBox(height: 20),

                  /// Proposer
                  Text(
                    '${S.current.proposer}:',
                    style: DSTextStyle.tsMontserratT12R
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  _buildProposerDropdown(viewModel),
                  const SizedBox(height: 10),

                  /// Title
                  Text(
                    '${S.current.title}:',
                    style: DSTextStyle.tsMontserratT12R
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  DSTextField(
                    height: textFieldHeight,
                    contentPadding: textFieldContentPadding,
                    hintText: S.current.title.toLowerCase(),
                    onChange: (String value) {},
                  ),
                  const SizedBox(height: 10),

                  /// Description
                  Text(
                    '${S.current.description}:',
                    style: DSTextStyle.tsMontserratT12R
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  DSTextField(
                    height: textFieldHeight,
                    contentPadding: textFieldContentPadding,
                    hintText: S.current.description.toLowerCase(),
                    onChange: (String value) {},
                  ),
                  const SizedBox(height: 10),

                  /// Initial Deposit
                  Text(
                    '${S.current.initial_deposit}:',
                    style: DSTextStyle.tsMontserratT12R
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  DSTextField(
                    height: textFieldHeight,
                    contentPadding: textFieldContentPadding,
                    onChange: (String value) {},
                  ),
                  const SizedBox(height: 10),

                  /// Minimal Deposit
                  Text(
                    '${S.current.minimal_deposit}:',
                    style: DSTextStyle.tsMontserratT12R
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  DSTextField(
                    height: textFieldHeight,
                    contentPadding: textFieldContentPadding,
                    disable: true,
                    hintText: '10000 DIG',
                    onChange: (String value) {},
                  ),
                  const SizedBox(height: 10),
                  ..._buildAdvanceSection(viewModel),
                  const SizedBox(height: 14),
                  _buildActionButtonWidget(viewModel)
                ]),
          ),
        ));
  }

  Widget _buildProposerDropdown(CreateProposalViewModel viewModel) {
    return DSTextFieldDropdownWidget(
        controller: _dropdownController,
        height: 30,
        contentPadding: const EdgeInsets.all(6),
        hintText: 'dig1wappp4nlv682q3f5fz4y0qk2mcvvmewc4sc8hs',
        child: Container(
          decoration: BoxDecoration(
              color: DSColors.tundora,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: DSColors.tundora),
              boxShadow: [
                BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    offset: const Offset(-1, 1),
                    blurRadius: 5,
                    blurStyle: BlurStyle.normal)
              ]),
          margin: const EdgeInsets.symmetric(horizontal: 49),
          height: 200,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  _dropdownController.close();
                },
                child: Text(
                  'dig1wappp4nlv682q3f5fz4y0qk2mcvvmewc4sc8hs',
                  style: DSTextStyle.tsMontserratT12R
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
            itemCount: 2,
          ),
        ));
  }

  List<Widget> _buildAdvanceSection(CreateProposalViewModel viewModel) {
    return

        /// Advance
        [
      Row(
        children: [
          DSCheckBox(
            width: 15,
            height: 15,
            initialChecked: false,
            onChanged: (value) {},
          ),
          const SizedBox(width: 9),
          Text(
            S.current.advanced,
            style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white),
          )
        ],
      ),
      if (viewModel.showAdvance)
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 4),
          child: Text(
            '${S.current.set_gas}:',
            style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white),
          ),
        ),
      if (viewModel.showAdvance)
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DSTextField(
              height: 30,
              contentPadding: const EdgeInsets.all(6),
              hintText:
                  '${S.current.minimum}: ${S.current.dig_token_format(0)}',
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                    RegExp(RegexPatternString.number)),
              ],
              onChange: (String value) {},
            ),
            // _errorMessage(viewmodel.gasValidMessage)
          ],
        ),
      const SizedBox(height: 17),
    ];
  }

  Row _buildActionButtonWidget(CreateProposalViewModel viewModel) => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DSSmallButton(
              title: S.current.cancel,
              backgroundColor: DSColors.silver2,
              onTap: () {
                _cubit.closeEvent();
              }),
          const SizedBox(width: 13),
          DSSmallButton(
              title: S.current.send, enable: true, onTap: () {}), // todo
        ],
      );

  // Widget _errorMessage(String text) => Padding(
  //   padding: EdgeInsets.only(top: text.isEmpty ? 0 : 2),
  //   child: Text(
  //     text,
  //     style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.red),
  //   ),
  // );
}
