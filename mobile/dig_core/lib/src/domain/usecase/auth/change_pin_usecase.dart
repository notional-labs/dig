import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class ChangePinUseCase extends UseCase<void, ChangePinUseCaseParam> {
  final AuthRepository _repository;
  ChangePinUseCase(this._repository);

  @override
  Future<Either<BaseDigException, void>> call(
      ChangePinUseCaseParam params) async {
    try {
      await _repository.changePin(params.pin);
      return const Right(null);
    } catch (e, trace) {
      Logger().e('ChangePinUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class ChangePinUseCaseParam {
  final String pin;
  const ChangePinUseCaseParam({required this.pin});
}
