import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class CreatePinUseCase extends UseCase<void, CreatePinUseCaseParam> {
  final AuthRepository _repository;
  CreatePinUseCase(this._repository);

  @override
  Future<Either<BaseDigException, void>> call(
      CreatePinUseCaseParam params) async {
    try {
      await _repository.createPin(params.pin);
      return const Right(null);
    } catch (e, trace) {
      Logger().e('CreatePinUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class CreatePinUseCaseParam {
  final String pin;
  const CreatePinUseCaseParam({required this.pin});
}
