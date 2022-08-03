import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/pin/pin_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/page/confirm_pin/confirm_pin_page.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PinCubit extends Cubit<PinState> {
  PinCubit(this._matchPinUseCase) : super(const PinPrimaryState());
  final MatchPinUseCase _matchPinUseCase;

  void changePinEvent(String pin) {
    emit(PinChangedState(viewmodel: state.viewmodel.copyWith(pin: pin)));
    emit(PinPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  void goToConfirmPinEvent() =>
      navigatorKey.currentState!.pushNamed(DigPageName.confirmPin,
          arguments: ConfirmPinPageParam(pin: state.viewmodel.pin));

  Future matchPinEvent() async {
    final result = await _matchPinUseCase
        .call(MatchPinUseCaseParam(pin: state.viewmodel.pin));
    final match = result.getOrElse(() => false);
    if (match) {
      emit(PinMatchedState(viewmodel: state.viewmodel.copyWith()));
      return;
    }
    emit(PinErrorState(
        viewmodel: state.viewmodel.copyWith(),
        exception: DigException(message: S.current.passcode_do_not_match)));
  }

  void backEvent() => navigatorKey.currentState!.pop();

  void goToHomeEvent() => navigatorKey.currentState!
      .pushNamedAndRemoveUntil(DigPageName.home, (route) => false);
}
