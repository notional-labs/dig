import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/active_account/transfer_token/transfer_token_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class TransferTokenCubit extends Cubit<TransferTokenState> {
  TransferTokenCubit(this._sendTokenUsecase)
      : super(const TransferTokenPrimaryState());

  final SendTokenUsecase _sendTokenUsecase;

  void init(
      {required String senderAddress,
      required double tokenAvailable,
      String? recipientAddress}) {
    emit(TransferTokenPrimaryState(
        viewmodel: state.viewmodel.copyWith(
            tokenAvailable: tokenAvailable,
            senderAddress: senderAddress,
            recipientAddress: recipientAddress)));
  }

  Future transferToken(AccountPublicInfo account) async {
    emit(TransferTokenSendingState(viewmodel: state.viewmodel.copyWith()));
    final amount = state.viewmodel.tokenToSend * TokenBalanceRatio.ratio;
    double fee = Fee.defaultFee;
    if (state.viewmodel.advance) {
      fee = state.viewmodel.gas * TokenBalanceRatio.ratio;
    }
    final result = await _sendTokenUsecase.call(SendTokenUsecaseParam(
        request: SendTokenRequest(
            info: account,
            balance:
                Balance(amount: amount.toStringAsFixed(0), denom: Denom.udig),
            fee: Balance(amount: fee.toStringAsFixed(0), denom: Denom.udig),
            toAddress: state.viewmodel.recipientAddress,
            password: '')));

    result.fold((l) {
      emit(TransferTokenErrorState(
          exception: l, viewmodel: state.viewmodel.copyWith()));
    }, (r) {
      emit(TransferTokenSuccessState(viewmodel: state.viewmodel.copyWith()));
    });
  }

  void changeAdvanceEvent(bool value) {
    emit(TransferTokenChangedFormState(
        viewmodel: state.viewmodel.copyWith(advance: value, gas: 0)));
    emit(TransferTokenPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void changeRecipientAddressEvent(String recipientAddress) {
    emit(TransferTokenChangedFormState(
        viewmodel:
            state.viewmodel.copyWith(recipientAddress: recipientAddress)));
    emit(TransferTokenPrimaryState(viewmodel: state.viewmodel));
  }

  void changeTokenToSendEvent(double tokenToSend) {
    emit(TransferTokenChangedFormState(
        viewmodel: state.viewmodel.copyWith(tokenToSend: tokenToSend)));
    emit(TransferTokenPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void changeGasEvent(double gas) {
    emit(TransferTokenChangedFormState(
        viewmodel: state.viewmodel.copyWith(gas: gas)));
    emit(TransferTokenPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void closeEvent([bool result = false]) =>
      navigatorKey.currentState!.pop(result);
}
