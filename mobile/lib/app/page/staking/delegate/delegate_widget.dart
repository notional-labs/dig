import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/staking/delegate/delegate_cubit.dart';
import 'package:dig_mobile_app/app/cubit/staking/delegate/delegate_state.dart';
import 'package:dig_mobile_app/app/definition/regex.dart';
import 'package:dig_mobile_app/app/designsystem/ds_textfield_dropdown_widget.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/delegate_validator_item_viewmodel.dart';
import 'package:dig_mobile_app/app/viewmodel/delegate_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:flutter/material.dart';
import 'package:dig_mobile_app/app/designsystem/ds_check_box.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_small_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_field.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dig_mobile_app/app/extension/extension.dart';

class DelegateWidgetParam {
  final AccountPublicInfo account;
  final num tokenAvailable;
  final DelegateValidatorItemViewmodel validatorSelected;
  final List<DelegateValidatorItemViewmodel> validators;

  const DelegateWidgetParam(
      {required this.account,
      required this.tokenAvailable,
      required this.validatorSelected,
      required this.validators});
}

class DelegateWidget extends StatefulWidget {
  final DelegateWidgetParam param;

  const DelegateWidget({required this.param, Key? key}) : super(key: key);

  @override
  State<DelegateWidget> createState() => _DelegateWidgetState();
}

class _DelegateWidgetState extends State<DelegateWidget> with WidgetUtil {
  final DelegateCubit _cubit = di();
  final DSTextFieldDropdownController _dropdownController =
      DSTextFieldDropdownController();

  void _onBlocListener(BuildContext context, DelegateState state) {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.init(
          delegatorAddress: widget.param.account.publicAddress,
          tokenAvailable: widget.param.tokenAvailable,
          validatorSelected: widget.param.validatorSelected,
          validators: widget.param.validators);
    });
  }

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: BlocConsumer<DelegateCubit, DelegateState>(
            bloc: _cubit,
            listener: _onBlocListener,
            builder: (BuildContext context, DelegateState state) =>
                _buildScrollableWidget(state.viewmodel)),
      );

  Widget _buildScrollableWidget(DelegateViewModel viewmodel) => GestureDetector(
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
                    child: _buildBodyWidget(viewmodel),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 5)
            ],
          ),
        ),
      );

  Widget _buildBodyWidget(DelegateViewModel viewmodel) => GestureDetector(
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
                    S.current.delegate_token,
                    style: DSTextStyle.tsMontserratT20B
                        .copyWith(color: DSColors.tulipTree),
                  ),
                  const SizedBox(height: 20),

                  /// Delegator address
                  Text(
                    '${S.current.delegator}:',
                    style: DSTextStyle.tsMontserratT12R
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  DSTextField(
                    disable: true,
                    hintText: widget.param.account.publicAddress
                        .trimMiddleWithDot(20),
                    onChange: (String value) {},
                  ),
                  const SizedBox(height: 10),

                  /// Validator address
                  Text(
                    '${S.current.validator}:',
                    style: DSTextStyle.tsMontserratT12R
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  DSTextFieldDropdownWidget(
                      controller: _dropdownController,
                      hintText:
                          '${viewmodel.validator.name} (${S.current.n_percent(viewmodel.validator.commsion)})',
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
                                _cubit.changeValidatorEvent(
                                    widget.param.validators[index]);
                                _dropdownController.close();
                              },
                              child: Text(
                                '${widget.param.validators[index].name} (${S.current.n_percent(widget.param.validators[index].commsion)})',
                                style: DSTextStyle.tsMontserratT12R
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          itemCount: widget.param.validators.length,
                        ),
                      )),
                  const SizedBox(height: 10),

                  /// Token available
                  Text(
                    '${S.current.amount_available}:',
                    style: DSTextStyle.tsMontserratT12R
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  DSTextField(
                    disable: true,
                    hintText: S.current.dig_token_format(
                        widget.param.tokenAvailable.toDigTokenDisplay()),
                    onChange: (String value) {},
                  ),
                  const SizedBox(height: 10),

                  /// Token to stake
                  Text(
                    '${S.current.amount_to_stack}:',
                    style: DSTextStyle.tsMontserratT12R
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  DSTextField(
                    hintText: S.current.dig_token_format(0),
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(RegexPatternString.number)),
                    ],
                    onChange: (String value) {
                      _cubit
                          .changeTokenToStakeEvent(double.tryParse(value) ?? 0);
                    },
                  ),
                  _errorMessage(viewmodel.tokenToStakeValidMessage),
                  const SizedBox(height: 10),

                  /// Advance
                  Row(
                    children: [
                      DSCheckBox(
                        width: 15,
                        height: 15,
                        initialChecked: false,
                        onChanged: (value) {
                          _cubit.changeAdvanceEvent(value);
                        },
                      ),
                      const SizedBox(width: 9),
                      Text(
                        S.current.advanced,
                        style: DSTextStyle.tsMontserratT12R
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  if (viewmodel.advance)
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 4),
                      child: Text(
                        '${S.current.set_gas}:',
                        style: DSTextStyle.tsMontserratT12R
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  if (viewmodel.advance)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DSTextField(
                          hintText:
                              '${S.current.minimum}: ${S.current.dig_token_format(0)}',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(RegexPatternString.number)),
                          ],
                          onChange: (String value) {
                            _cubit.changeGasEvent(double.tryParse(value) ?? 0);
                          },
                        ),
                        _errorMessage(viewmodel.gasValidMessage)
                      ],
                    ),
                  const SizedBox(height: 17),
                  _buildActionButtonWidget(viewmodel),
                ]),
          ),
        ),
      );

  Row _buildActionButtonWidget(DelegateViewModel viewmodel) => Row(
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
              title: S.current.send, enable: viewmodel.isAllValid, onTap: () {})
        ],
      );

  Widget _errorMessage(String text) => Padding(
        padding: EdgeInsets.only(top: text.isEmpty ? 0 : 2),
        child: Text(
          text,
          style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.red),
        ),
      );
}
