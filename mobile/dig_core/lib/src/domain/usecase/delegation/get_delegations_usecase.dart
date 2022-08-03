import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegation_data.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegations_request.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dig_core/src/domain/repository/delegation_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class GetDelegationsUseCase
    extends UseCase<List<DelegationData>, GetDelegationsUseCaseParam> {
  final DelegationRepository _repository;
  final ENV _env;

  GetDelegationsUseCase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, List<DelegationData>>> call(
      GetDelegationsUseCaseParam params) async {
    try {
      _repository.createChainENV(params.chain ?? _env.digChain);
      final result = await _repository.getDelegations(params.request);
      return Right(result.delegationResponses);
    } catch (e, trace) {
      Logger().e('GetDelegationsUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetDelegationsUseCaseParam {
  final GetDelegationsRequest request;
  final ChainENV? chain;

  const GetDelegationsUseCaseParam({required this.request, this.chain});
}
