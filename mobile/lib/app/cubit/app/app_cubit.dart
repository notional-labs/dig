import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/app/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppCubit extends Cubit<AppState> {
  AppCubit(this._getSelectedAccountUseCase, this._checkHasPinUseCase)
      : super(const AppPrimaryState());
  final GetSelectedAccountUseCase _getSelectedAccountUseCase;
  final CheckHasPinUseCase _checkHasPinUseCase;

  Future<bool> shouldEnterPIN() async {
    AccountPublicInfo? account;
    bool hasPin = false;
    final getSelectedAccountUseCaseResult = await _getSelectedAccountUseCase
        .call(const GetSelectedAccountUseCaseParam());

    getSelectedAccountUseCaseResult.fold((l) {}, (r) {
      account = r;
    });

    final checkHasPinUseCaseResult =
        await _checkHasPinUseCase.call(const None());
    hasPin = checkHasPinUseCaseResult.getOrElse(() => false);

    return account != null && hasPin;
  }
}
