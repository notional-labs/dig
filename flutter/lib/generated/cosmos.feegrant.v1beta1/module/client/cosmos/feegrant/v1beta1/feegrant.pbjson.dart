///
//  Generated code. Do not modify.
//  source: cosmos/feegrant/v1beta1/feegrant.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

const BasicAllowance$json = const {
  '1': 'BasicAllowance',
  '2': const [
    const {'1': 'spend_limit', '3': 1, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'spendLimit'},
    const {'1': 'expiration', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'expiration'},
  ],
  '7': const {},
};

const PeriodicAllowance$json = const {
  '1': 'PeriodicAllowance',
  '2': const [
    const {'1': 'basic', '3': 1, '4': 1, '5': 11, '6': '.cosmos.feegrant.v1beta1.BasicAllowance', '8': const {}, '10': 'basic'},
    const {'1': 'period', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '8': const {}, '10': 'period'},
    const {'1': 'period_spend_limit', '3': 3, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'periodSpendLimit'},
    const {'1': 'period_can_spend', '3': 4, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'periodCanSpend'},
    const {'1': 'period_reset', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'periodReset'},
  ],
  '7': const {},
};

const AllowedMsgAllowance$json = const {
  '1': 'AllowedMsgAllowance',
  '2': const [
    const {'1': 'allowance', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Any', '8': const {}, '10': 'allowance'},
    const {'1': 'allowed_messages', '3': 2, '4': 3, '5': 9, '10': 'allowedMessages'},
  ],
  '7': const {},
};

const Grant$json = const {
  '1': 'Grant',
  '2': const [
    const {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    const {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
    const {'1': 'allowance', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Any', '8': const {}, '10': 'allowance'},
  ],
};

