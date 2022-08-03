import 'package:dig_core/src/domain/entity/staking/delegations/delegation_unbonding_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegations_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegator_rewards_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegation_unbonding_request.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegations_request.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/requests/get_delegator_rewards_request.dart';
import 'package:dig_core/src/domain/env/env.dart';

abstract class DelegationRepository {
  ChainENV createChainENV(ChainENV chain);

  Future<DelegationsResponse> getDelegations(GetDelegationsRequest request);

  Future<DelegatorRewardsResponse> getDelegatorRewards(
      GetDelegatorRewardsRequest request);

  Future<DelegationUnBondingResponse> getDelegationUnBonding(
      GetDelegationUnBondingRequest request);
}
