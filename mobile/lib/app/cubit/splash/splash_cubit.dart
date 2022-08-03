import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/splash/splash_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/page/pin/pin_page.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._getAccountListUseCase, this._checkHasPinUseCase,
      this._checkFirstRunUseCase, this._deletePinUseCase)
      : super(const SplashUninitState());

  final GetSelectedAccountUseCase _getAccountListUseCase;
  final CheckHasPinUseCase _checkHasPinUseCase;
  final CheckFirstTimeRunAppUseCase _checkFirstRunUseCase;
  final DeletePinUseCase _deletePinUseCase;

  Future checkAuthentication() async {
    Future.delayed(const Duration(seconds: 2), () async {
      await cleanOldData();
      final result = await _getAccountListUseCase
          .call(const GetSelectedAccountUseCaseParam());
      result.fold((failure) {
        navigatorKey.currentState
            ?.pushNamedAndRemoveUntil(DigPageName.signIn, (route) => false);
      }, (account) {
        enterOrCreatePinEvent(account);
      });
    });
  }

  /// PIN save in KeyChain on IOS.
  /// Data in KeyChain alway remain after uninstalled app.
  /// So need to clearn data at first time open app.
  Future cleanOldData() async {
    final result = await _checkFirstRunUseCase.call(const None());
    final bool isFirstCall = result.getOrElse(() => false);
    if (isFirstCall) {
      await _deletePinUseCase.call(const None());
    }
  }

  Future enterOrCreatePinEvent(account) async {
    final result = await _checkHasPinUseCase.call(const None());
    final exist = result.getOrElse(() => false);

    if (!exist) {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          DigPageName.pin, (route) => false,
          arguments: PinPageType.create);
      return;
    }
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
        DigPageName.pin, (route) => false,
        arguments: PinPageType.authWhenLauchApp);
  }
}
