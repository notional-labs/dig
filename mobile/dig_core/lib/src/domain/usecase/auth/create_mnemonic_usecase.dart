import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dig_core/src/domain/entity/create_mnemonic.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class CreateMnemonicUseCase extends UseCase<String, None> {
  final AuthRepository _repository;
  CreateMnemonicUseCase(this._repository);
  @override
  Future<Either<BaseDigException, String>> call(None params) async {
    try {
      final result = await _repository.createMnemonic(const CreateMnemonic());
      return Right(result);
    } catch (e, trace) {
      Logger().e('CreateMnemonicUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}
