///
//  Generated code. Do not modify.
//  source: cosmos/staking/v1beta1/authz.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const AuthorizationType$json = const {
  '1': 'AuthorizationType',
  '2': const [
    const {'1': 'AUTHORIZATION_TYPE_UNSPECIFIED', '2': 0},
    const {'1': 'AUTHORIZATION_TYPE_DELEGATE', '2': 1},
    const {'1': 'AUTHORIZATION_TYPE_UNDELEGATE', '2': 2},
    const {'1': 'AUTHORIZATION_TYPE_REDELEGATE', '2': 3},
  ],
};

const StakeAuthorization$json = const {
  '1': 'StakeAuthorization',
  '2': const [
    const {'1': 'max_tokens', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'maxTokens'},
    const {'1': 'allow_list', '3': 2, '4': 1, '5': 11, '6': '.cosmos.staking.v1beta1.StakeAuthorization.Validators', '9': 0, '10': 'allowList'},
    const {'1': 'deny_list', '3': 3, '4': 1, '5': 11, '6': '.cosmos.staking.v1beta1.StakeAuthorization.Validators', '9': 0, '10': 'denyList'},
    const {'1': 'authorization_type', '3': 4, '4': 1, '5': 14, '6': '.cosmos.staking.v1beta1.AuthorizationType', '10': 'authorizationType'},
  ],
  '3': const [StakeAuthorization_Validators$json],
  '7': const {},
  '8': const [
    const {'1': 'validators'},
  ],
};

const StakeAuthorization_Validators$json = const {
  '1': 'Validators',
  '2': const [
    const {'1': 'address', '3': 1, '4': 3, '5': 9, '10': 'address'},
  ],
};

