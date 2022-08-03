import 'package:dig_core/dig_core.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/definition/definition.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class CheckMnemonicValidUseCase
    extends SyncUseCase<bool, CheckMnemonicValidUseCaseParam> {
  @override
  Either<BaseDigException, bool> call(CheckMnemonicValidUseCaseParam params) {
    try {
      if (params.mnemonic.isEmpty) {
        return const Left(
            DigException(message: DomainErrorMessage.mnemonicCannotBeEmpty));
      } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(params.mnemonic)) {
        return const Left(
            DigException(message: DomainErrorMessage.invalidCharacter));
      }

      /// TOTO: Confirm later
      // else if (![12, 24].contains(params.mnemonic.splitToWords().length)) {
      //   return const Left(DigException(
      //       message: 'Mnemonic must have at exactly 12 or 24 words'));
      // }
      else if (!bip39.validateMnemonic(params.mnemonic)) {
        return const Left(
            DigException(message: DomainErrorMessage.invalidMnemonic));
      }
      return const Right(true);
    } catch (e, trace) {
      Logger().e('CheckMnemonicValidUseCase ERROR', e, trace);
      return const Left(
          DigException(message: DomainErrorMessage.invalidMnemonic));
    }
  }
}

class CheckMnemonicValidUseCaseParam {
  final String mnemonic;
  const CheckMnemonicValidUseCaseParam({required this.mnemonic});
}
