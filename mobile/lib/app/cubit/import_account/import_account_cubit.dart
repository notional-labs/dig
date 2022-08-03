import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/import_account/import_account_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ImportAccountCubit extends Cubit<ImportAccountState> {
  ImportAccountCubit(this._checkMnemonicValidUseCase)
      : super(const ImportAccountPrimaryState());
  final CheckMnemonicValidUseCase _checkMnemonicValidUseCase;

  void changeRecoveryPhraseEvent(String mnemonic) {
    emit(ImportAccountChangedFormState(
        viewmodel: state.viewmodel.copyWith(mnemonic: mnemonic)));
    final mnemonicMessage = checkMnemonicValid(state.viewmodel.mnemonic);
    emit(ImportAccountPrimaryState(
        viewmodel: state.viewmodel.copyWith(mnemonicMessage: mnemonicMessage)));
  }

  String checkMnemonicValid(String mnemonic) {
    final result = _checkMnemonicValidUseCase
        .call(CheckMnemonicValidUseCaseParam(mnemonic: mnemonic));
    return result.fold((l) {
      return l.message;
    }, (_) {
      return '';
    });
  }

  Future importEvent() async {
    emit(ImportAccountLoadingState(viewmodel: state.viewmodel.copyWith()));
    emit(ImportAccountSuccessState(viewmodel: state.viewmodel.copyWith()));
  }

  void backEvent() => navigatorKey.currentState!.pop();

  /// TODO: Impl [tapAdvancedEvent]
  void tapAdvancedEvent() {}

  Future<dynamic> goToNameAccountEvent() => navigatorKey.currentState!
      .pushNamed(DigPageName.nameAccount, arguments: state.viewmodel.mnemonic);
}
