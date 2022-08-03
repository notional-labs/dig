import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegator_rewards_request.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/reward_data.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dig_core/src/domain/repository/delegation_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class GetDelegatorRewardsUseCase
    extends UseCase<List<RewardData>, GetDelegatorRewardsUseCaseParam> {
  final DelegationRepository _repository;
  final ENV _env;

  GetDelegatorRewardsUseCase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, List<RewardData>>> call(
      GetDelegatorRewardsUseCaseParam params) async {
    try {
      _repository.createChainENV(params.chain ?? _env.digChain);
      final result = await _repository.getDelegatorRewards(params.request);
      return Right(result.rewards);
    } catch (e, trace) {
      Logger().e('GetDelegatorRewardsUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetDelegatorRewardsUseCaseParam {
  final GetDelegatorRewardsRequest request;
  final ChainENV? chain;

  const GetDelegatorRewardsUseCaseParam({required this.request, this.chain});
}
