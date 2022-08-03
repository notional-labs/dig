import 'package:dig_core/src/data/definition/definition.dart';
import 'package:dig_core/src/domain/entity/balance_response.dart';
import 'package:dig_core/src/domain/entity/proposals/proposals_response.dart';
import 'package:dig_core/src/domain/entity/proposals/proposer_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegation_unbonding_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegations_response.dart';
import 'package:dig_core/src/domain/entity/staking/delegations/delegator_rewards_response.dart';
import 'package:dig_core/src/domain/entity/staking/logo_response.dart';
import 'package:dig_core/src/domain/entity/staking/validator_response.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(parser: Parser.JsonSerializable, autoCastResponse: true)
abstract class RestClient {
  factory RestClient.from(Dio dio, ChainENV env) =>
      _RestClient(dio, baseUrl: env.baseApiUrl);

  @GET(EndPoint.getBalancePath)
  Future<BalanceResponse> getBalances(
      {@Path('address') required String address,
      @Query('pagination.key') String? nextPageKey,
      @Query('pagination.limit') int limit = 15});

  @GET(EndPoint.getProposals)
  Future<ProposalsResponse> getProposals(
      {@Query('pagination.key') String? nextPageKey,
      @Query('pagination.limit') int limit = 0}); // todo support paging later

  @GET(EndPoint.proposer)
  Future<ProposerResponse> getProposer(
      {@Path('proposerId') required String proposerId});

  @GET(EndPoint.validators)
  Future<ValidatorResponse> getValidators();

  @GET(EndPoint.validatorLogo)
  Future<LogoResponse> getValidatorLogo(
      {@Path('identity') required String identity});

  @GET(EndPoint.getDelegations)
  Future<DelegationsResponse> getDelegations(
      {@Path('address') required String address});

  @GET(EndPoint.getDelegatorRewards)
  Future<DelegatorRewardsResponse> getDelegatorRewards(
      {@Path('address') required String address});

  @GET(EndPoint.getDelegationUnBonding)
  Future<DelegationUnBondingResponse> getDelegationUnBonding(
      {@Path('address') required String address});
}
