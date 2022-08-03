import 'package:dig_core/src/data/datasource/remote/delegation_remote_datasource.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegation_unbonding_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegations_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegator_rewards_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegation_unbonding_request.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegations_request.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegator_rewards_request.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/repository/delegation_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DelegationRepository)
class DelegationRepositoryImpl implements DelegationRepository {
  final DelegationRemoteDataSource _datasource;

  DelegationRepositoryImpl(this._datasource);

  @override
  ChainENV createChainENV(ChainENV chain) => _datasource.createChain(chain);

  @override
  Future<DelegationsResponse> getDelegations(GetDelegationsRequest request) =>
      _datasource.getDelegations(request);

  @override
  Future<DelegatorRewardsResponse> getDelegatorRewards(
          GetDelegatorRewardsRequest request) =>
      _datasource.getDelegatorRewards(request);

  @override
  Future<DelegationUnBondingResponse> getDelegationUnBonding(
          GetDelegationUnBondingRequest request) =>
      _datasource.getDelegationUnBonding(request);
}
