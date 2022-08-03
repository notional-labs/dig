import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/active_account/transfer_token/transfer_token_cubit.dart';
import 'package:dig_mobile_app/app/cubit/active_account/transfer_token/transfer_token_state.dart';
import 'package:dig_mobile_app/app/definition/regex.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/designsystem/ds_snack_bar.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/transfer_token_viewmodel.dart';
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

/// After token has sent success,
/// [TransferTokenWidget] close and return [true] value.

class TransferTokenWidgetParam {
  final AccountPublicInfo account;
  final double tokenAvailable;
  final String? toAddress;

  const TransferTokenWidgetParam(
      {required this.account, required this.tokenAvailable, this.toAddress});
}

class TransferTokenWidget extends StatefulWidget {
  final TransferTokenWidgetParam param;

  const TransferTokenWidget({required this.param, Key? key}) : super(key: key);

  @override
  State<TransferTokenWidget> createState() => _TransferTokenWidgetState();
}

class _TransferTokenWidgetState extends State<TransferTokenWidget>
    with WidgetUtil {
  final TransferTokenCubit _cubit = di();
  final TextEditingController _toRecipientController = TextEditingController();

  void _onBlocListener(BuildContext context, TransferTokenState state) {
    if (state is TransferTokenSendingState) {
      showGlobalLoadingOverlay();
      return;
    }

    dismissGlobalLoadingOverlay();

    if (state is TransferTokenErrorState) {
      showGlobalDSSnackBar(
          message: state.exception.message, type: DSSnackBarType.error);
      return;
    }

    if (state is TransferTokenSuccessState) {
      showGlobalDSSnackBar(
          message: S.current.token_sent, type: DSSnackBarType.success);
      _cubit.closeEvent(true);
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _toRecipientController.text = widget.param.toAddress ?? '';
      _cubit.init(
          senderAddress: widget.param.account.publicAddress,
          tokenAvailable: widget.param.tokenAvailable,
          recipientAddress: widget.param.toAddress);
    });
  }

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: BlocConsumer<TransferTokenCubit, TransferTokenState>(
            bloc: _cubit,
            listener: _onBlocListener,
            builder: (BuildContext context, TransferTokenState state) =>
                _buildScrollableWidget(state.viewmodel)),
      );

  Widget _buildScrollableWidget(TransferTokenViewModel viewmodel) =>
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
                    child: _buildBodyWidget(viewmodel),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 5)
            ],
          ),
        ),
      );

  Widget _buildBodyWidget(TransferTokenViewModel viewmodel) => GestureDetector(
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
                    S.current.transfer_token,
                    style: DSTextStyle.tsMontserratT20B
                        .copyWith(color: DSColors.tulipTree),
                  ),
                  const SizedBox(height: 20),

                  /// Sender address
                  Text(
                    '${S.current.from}:',
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

                  /// Recipent address
                  Text(
                    '${S.current.to}:',
                    style: DSTextStyle.tsMontserratT12R
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  DSTextField(
                    hintText: S.current.recipient_address,
                    controller: _toRecipientController,
                    onChange: (String value) {
                      _cubit.changeRecipientAddressEvent(value);
                    },
                    textInputAction: TextInputAction.next,
                  ),
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

                  /// Token to send
                  Text(
                    '${S.current.amount_to_send}:',
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
                          .changeTokenToSendEvent(double.tryParse(value) ?? 0);
                    },
                  ),
                  _errorMessage(viewmodel.tokenToSendValidMessage),
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
                              '${S.current.minimum}: ${S.current.dig_token_format(Fee.defaultFeeDisplay)}',
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

  Row _buildActionButtonWidget(TransferTokenViewModel viewmodel) => Row(
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
              title: S.current.send,
              enable: viewmodel.isAllValid,
              onTap: () {
                _cubit.transferToken(widget.param.account);
              })
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
