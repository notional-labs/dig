abstract class DigKey {
  static const String pin = 'DIG_PIN';
  static const String accountId = 'ACCOUNT_ID';
}

abstract class HttpCode {
  /// TODO: Ask BE for correct [expiredToken]
  static int expiredToken = 10000000;
}

abstract class EndPoint {
  static const String getBalancePath = 'cosmos/bank/v1beta1/balances/{address}';
  static const String getProposals = 'cosmos/gov/v1beta1/proposals';
  static const String proposer = 'gov/proposals/{proposerId}/proposer';
  static const String validators = 'staking/validators';
  static const String validatorLogo =
      'https://keybase.io/_/api/1.0/user/lookup.json?key_suffix={identity}&fields=pictures';
  static const String getDelegations =
      'cosmos/staking/v1beta1/delegations/{address}';
  static const String getDelegatorRewards =
      'cosmos/distribution/v1beta1/delegators/{address}/rewards';
  static const String getDelegationUnBonding =
      '/cosmos/staking/v1beta1/delegators/{address}/unbonding_delegations';

  static const String market = 'api/v3/coins/markets';
  static const String marketChart = 'api/v3/coins/{id}/market_chart';
}

abstract class GetItInstanceName {
  static const String restClientDigChain = 'REST_CLIENT_DIG_CHAIN';
}

abstract class DataErrorMessage {
  static const String networkError = 'Please check your connect';
  static const String derivatorNotFound = 'Derivator Not Found';
  static const String unknownError = 'Unknown Error';
}
