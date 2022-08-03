import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/entity/staking/validator_response.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dig_core/src/domain/repository/validator_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class GetValidatorUseCase
    extends UseCase<ValidatorResponse, GetValidatorUseCaseParam> {
  final ValidatorRepository _repository;
  final ENV _env;

  GetValidatorUseCase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, ValidatorResponse>> call(
      GetValidatorUseCaseParam params) async {
    try {
      _repository.createChain(params.chain ?? _env.digChain);
      final result = await _repository.getValidators();
      return Right(result);
    } catch (e, trace) {
      Logger().e('GetValidatorUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetValidatorUseCaseParam {
  final ChainENV? chain;

  const GetValidatorUseCaseParam({this.chain});
}
