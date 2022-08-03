import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/name_account/import_account/name_account_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/page/pin/pin_page.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class NameAccountCubit extends Cubit<NameAccountState> {
  NameAccountCubit(this._importAccountUseCase, this._checkHasPinUseCase,
      this._selectAccountUseCase)
      : super(const NameAccountUninitState());

  final ImportAccountUseCase _importAccountUseCase;
  final CheckHasPinUseCase _checkHasPinUseCase;
  final SelectAccountUseCase _selectAccountUseCase;

  void init(String mnemonic) {
    emit(NameAccountPrimaryState(
        viewmodel: state.viewmodel.copyWith(mnemonic: mnemonic)));
  }

  Future changeNameAccountEvent(String name) async {
    emit(NameAccountChangedFormState(
        viewmodel: state.viewmodel.copyWith(name: name)));
    emit(NameAccountPrimaryState(viewmodel: state.viewmodel.copyWith()));
  }

  Future createEvent() async {
    emit(NameAccountLoadingState(viewmodel: state.viewmodel.copyWith()));
    final result = await _importAccountUseCase.call(ImportAccountUseCaseParam(
        importAccount: ImportAccount(
            importAccountFormData: ImportAccountFormData(
                name: state.viewmodel.name,
                password: '',
                mnemonic: state.viewmodel.mnemonic,
                additionalData:
                    const AccountAdditionalData(isBackedUp: false)))));
    result.fold((l) {
      emit(NameAccountErrorState(
          exception: l, viewmodel: state.viewmodel.copyWith()));
    }, (account) {
      _selectAccountUseCase
          .call(SelectAccountUseCaseParam(accountPublicInfo: account));
      emit(NameAccountSuccessState(
          accountPublicInfo: account, viewmodel: state.viewmodel.copyWith()));
    });
  }

  Future checkShouldCreatePINEvent(AccountPublicInfo accountPublicInfo) async {
    final result = await _checkHasPinUseCase.call(const None());
    final exist = result.getOrElse(() => false);

    if (!exist) {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          DigPageName.pin, (route) => false,
          arguments: PinPageType.create);
      return;
    }

    goToHome(accountPublicInfo);
  }

  void goToHome(AccountPublicInfo accountPublicInfo) =>
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
          DigPageName.home, (route) => false,
          arguments: accountPublicInfo);

  void backEvent() => navigatorKey.currentState!.pop();

  /// TODO: Impl [tapAdvancedEvent]
  void tapAdvancedEvent() {}
}
