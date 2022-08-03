import 'package:dig_core/src/data/extension/chain_extension.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegation_unbonding_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegations_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegator_rewards_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegation_unbonding_request.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegations_request.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegator_rewards_request.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:injectable/injectable.dart';

abstract class DelegationRemoteDataSource {
  ChainENV createChain(ChainENV chain);

  Future<DelegationsResponse> getDelegations(GetDelegationsRequest request);

  Future<DelegatorRewardsResponse> getDelegatorRewards(
      GetDelegatorRewardsRequest request);

  Future<DelegationUnBondingResponse> getDelegationUnBonding(
      GetDelegationUnBondingRequest request);
}

@Injectable(as: DelegationRemoteDataSource)
class DelegationRemoteDataSourceImpl implements DelegationRemoteDataSource {
  ChainENV? _chain;

  @override
  ChainENV createChain(ChainENV chain) {
    _chain ??= chain;
    return _chain!;
  }

  @override
  Future<DelegationsResponse> getDelegations(GetDelegationsRequest request) {
    assert(_chain != null,
        '`_chain` must be not null. Ensure called `createChain` first');
    final restClient = _chain!.getRestClient();
    return restClient.getDelegations(address: request.address);
  }

  @override
  Future<DelegatorRewardsResponse> getDelegatorRewards(
      GetDelegatorRewardsRequest request) {
    assert(_chain != null,
        '`_chain` must be not null. Ensure called `createChain` first');
    final restClient = _chain!.getRestClient();
    return restClient.getDelegatorRewards(address: request.address);
  }

  @override
  Future<DelegationUnBondingResponse> getDelegationUnBonding(
      GetDelegationUnBondingRequest request) {
    assert(_chain != null,
        '`_chain` must be not null. Ensure called `createChain` first');
    final restClient = _chain!.getRestClient();
    return restClient.getDelegationUnBonding(address: request.address);
  }
}
