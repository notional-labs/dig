import 'package:dig_core/src/data/exception/dig_exception_impl.dart';
import 'package:dig_core/src/domain/definition/definition.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/repository/validator_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class GetValidatorLogoUseCase
    extends UseCase<String, GetValidatorLogoUseCaseParam> {
  final ValidatorRepository _repository;
  final ENV _env;

  GetValidatorLogoUseCase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, String>> call(
      GetValidatorLogoUseCaseParam params) async {
    try {
      _repository.createChain(params.chain ?? _env.digChain);
      final result = await _repository.getLogo(params.identity);
      if (result.them.isEmpty ||
          result.them.first.pictures.primary.url.isEmpty) {
        throw const DigException(
            message: DomainErrorMessage.noValidatorLogoFound);
      }
      return Right(result.them.first.pictures.primary.url);
    } catch (e, trace) {
      Logger().e('GetValidatorLogoUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetValidatorLogoUseCaseParam {
  final String identity;
  final ChainENV? chain;

  const GetValidatorLogoUseCaseParam({required this.identity, this.chain});
}
