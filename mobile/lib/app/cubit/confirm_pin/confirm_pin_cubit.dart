import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/confirm_pin/confirm_pin_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConfirmPinCubit extends Cubit<ConfirmPinState> {
  ConfirmPinCubit(this._createPinUseCase)
      : super(const ConfirmPinPrimaryState());

  final CreatePinUseCase _createPinUseCase;

  void init(String pin) {
    emit(ConfirmPinPrimaryState(viewmodel: state.viewmodel.copyWith(pin: pin)));
  }

  void changeConfirmPinEvent(String confirmPin) {
    emit(ConfirmPinChangedState(
        viewmodel: state.viewmodel.copyWith(confirmPin: confirmPin)));
    emit(ConfirmPinPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  Future<bool> createPinEvent() async {
    if (state.viewmodel.isValid) {
      final result = await _createPinUseCase
          .call(CreatePinUseCaseParam(pin: state.viewmodel.pin));
      result.fold((l) {
        emit(ConfirmPinErrorState(
            viewmodel: state.viewmodel.copyWith(),
            exception: DigException(message: l.message)));
      }, (r) {
        emit(ConfirmPinSuccessState(viewmodel: state.viewmodel.copyWith()));
      });
      return true;
    }

    emit(ConfirmPinErrorState(
        viewmodel: state.viewmodel.copyWith(),
        exception: DigException(message: S.current.passcode_do_not_match)));
    return true;
  }

  void backEvent() => navigatorKey.currentState!.pop();

  void goToHomeEvent() => navigatorKey.currentState!
      .pushNamedAndRemoveUntil(DigPageName.home, (route) => false);
}
