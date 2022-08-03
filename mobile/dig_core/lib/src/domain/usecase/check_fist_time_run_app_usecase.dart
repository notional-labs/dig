import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:logger/logger.dart';

@injectable
class CheckFirstTimeRunAppUseCase extends UseCase<bool, None> {
  @override
  Future<Either<BaseDigException, bool>> call(None params) async {
    try {
      final bool result = await IsFirstRun.isFirstRun();
      return Right(result);
    } catch (e, trace) {
      Logger().e('CheckFirstRunUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}
