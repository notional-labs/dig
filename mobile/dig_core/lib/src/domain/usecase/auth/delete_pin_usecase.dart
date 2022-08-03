import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class DeletePinUseCase extends UseCase<void, None> {
  final AuthRepository _repository;
  DeletePinUseCase(this._repository);

  @override
  Future<Either<BaseDigException, void>> call(None params) async {
    try {
      await _repository.deletePin();
      return const Right(null);
    } catch (e, trace) {
      Logger().e('DeletePinUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}
