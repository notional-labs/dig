import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class CheckHasPinUseCase extends UseCase<bool, None> {
  final AuthRepository _repository;
  CheckHasPinUseCase(this._repository);
  @override
  Future<Either<BaseDigException, bool>> call(None params) async {
    try {
      final result = await _repository.checkHasPin();
      return Right(result);
    } catch (e, trace) {
      Logger().e('CheckHasPinUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}
