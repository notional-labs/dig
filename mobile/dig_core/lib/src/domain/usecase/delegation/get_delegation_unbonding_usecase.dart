import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegation_unbonding_data.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegation_unbonding_request.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dig_core/src/domain/repository/delegation_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:logger/logger.dart';

class GetDelegationUnBondingUseCase extends UseCase<
    List<DelegationUnBondingData>, GetDelegationUnBondingUseCaseParam> {
  final DelegationRepository _repository;
  final ENV _env;

  GetDelegationUnBondingUseCase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, List<DelegationUnBondingData>>> call(
      GetDelegationUnBondingUseCaseParam params) async {
    try {
      _repository.createChainENV(params.chain ?? _env.digChain);
      final result = await _repository.getDelegationUnBonding(params.request);
      return Right(result.unbondingResponses);
    } catch (e, trace) {
      Logger().e('GetDelegationUnBondingUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetDelegationUnBondingUseCaseParam {
  final GetDelegationUnBondingRequest request;
  final ChainENV? chain;

  const GetDelegationUnBondingUseCaseParam({required this.request, this.chain});
}
