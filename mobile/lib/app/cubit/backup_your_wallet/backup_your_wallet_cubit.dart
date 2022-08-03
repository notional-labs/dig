import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:injectable/injectable.dart';

part 'backup_your_wallet_state.dart';

@Injectable()
class BackupYourWalletCubit extends Cubit<BackupYourWalletState> {
  final CreateMnemonicUseCase _createMnemonicUseCase;

  BackupYourWalletCubit(this._createMnemonicUseCase)
      : super(BackupYourWalletInitial());

  Future onBackUpNowTap() async {
    final result = await _createMnemonicUseCase.call(const None());
    result.fold(
        (failure) => null,
        (mnemonic) => navigatorKey.currentState!
            .pushNamed(DigPageName.recoveryPhrase, arguments: mnemonic));
  }
}
