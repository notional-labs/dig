import 'package:dig_core/src/data/exception/dig_exception_handler_impl.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, P> {
  final DigExceptionHandler exceptionHandler = DigExceptionHandler();
  Future<Either<BaseDigException, T>> call(P params);
}

abstract class SyncUseCase<T, P> {
  final DigExceptionHandler exceptionHandler = DigExceptionHandler();
  Either<BaseDigException, T> call(P params);
}
