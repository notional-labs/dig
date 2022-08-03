import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class MatchPinUseCase extends UseCase<bool, MatchPinUseCaseParam> {
  final AuthRepository _repository;
  MatchPinUseCase(this._repository);
  @override
  Future<Either<BaseDigException, bool>> call(
      MatchPinUseCaseParam params) async {
    try {
      final result = await _repository.matchPin(params.pin);
      return Right(result);
    } catch (e, trace) {
      Logger().e('MatchPinUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class MatchPinUseCaseParam {
  final String pin;
  const MatchPinUseCaseParam({required this.pin});
}
