///
//  Generated code. Do not modify.
//  source: cosmos/distribution/v1beta1/genesis.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use delegatorWithdrawInfoDescriptor instead')
const DelegatorWithdrawInfo$json = const {
  '1': 'DelegatorWithdrawInfo',
  '2': const [
    const {'1': 'delegator_address', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'delegatorAddress'},
    const {'1': 'withdraw_address', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'withdrawAddress'},
  ],
  '7': const {},
};

/// Descriptor for `DelegatorWithdrawInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List delegatorWithdrawInfoDescriptor = $convert.base64Decode('ChVEZWxlZ2F0b3JXaXRoZHJhd0luZm8SSQoRZGVsZWdhdG9yX2FkZHJlc3MYASABKAlCHPLeHxh5YW1sOiJkZWxlZ2F0b3JfYWRkcmVzcyJSEGRlbGVnYXRvckFkZHJlc3MSRgoQd2l0aGRyYXdfYWRkcmVzcxgCIAEoCUIb8t4fF3lhbWw6IndpdGhkcmF3X2FkZHJlc3MiUg93aXRoZHJhd0FkZHJlc3M6COigHwCIoB8A');
@$core.Deprecated('Use validatorOutstandingRewardsRecordDescriptor instead')
const ValidatorOutstandingRewardsRecord$json = const {
  '1': 'ValidatorOutstandingRewardsRecord',
  '2': const [
    const {'1': 'validator_address', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'validatorAddress'},
    const {'1': 'outstanding_rewards', '3': 2, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.DecCoin', '8': const {}, '10': 'outstandingRewards'},
  ],
  '7': const {},
};

/// Descriptor for `ValidatorOutstandingRewardsRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorOutstandingRewardsRecordDescriptor = $convert.base64Decode('CiFWYWxpZGF0b3JPdXRzdGFuZGluZ1Jld2FyZHNSZWNvcmQSSQoRdmFsaWRhdG9yX2FkZHJlc3MYASABKAlCHPLeHxh5YW1sOiJ2YWxpZGF0b3JfYWRkcmVzcyJSEHZhbGlkYXRvckFkZHJlc3MSoAEKE291dHN0YW5kaW5nX3Jld2FyZHMYAiADKAsyHC5jb3Ntb3MuYmFzZS52MWJldGExLkRlY0NvaW5CUarfHytnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkRlY0NvaW5zyN4fAPLeHxp5YW1sOiJvdXRzdGFuZGluZ19yZXdhcmRzIlISb3V0c3RhbmRpbmdSZXdhcmRzOgjooB8AiKAfAA==');
@$core.Deprecated('Use validatorAccumulatedCommissionRecordDescriptor instead')
const ValidatorAccumulatedCommissionRecord$json = const {
  '1': 'ValidatorAccumulatedCommissionRecord',
  '2': const [
    const {'1': 'validator_address', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'validatorAddress'},
    const {'1': 'accumulated', '3': 2, '4': 1, '5': 11, '6': '.cosmos.distribution.v1beta1.ValidatorAccumulatedCommission', '8': const {}, '10': 'accumulated'},
  ],
  '7': const {},
};

/// Descriptor for `ValidatorAccumulatedCommissionRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorAccumulatedCommissionRecordDescriptor = $convert.base64Decode('CiRWYWxpZGF0b3JBY2N1bXVsYXRlZENvbW1pc3Npb25SZWNvcmQSSQoRdmFsaWRhdG9yX2FkZHJlc3MYASABKAlCHPLeHxh5YW1sOiJ2YWxpZGF0b3JfYWRkcmVzcyJSEHZhbGlkYXRvckFkZHJlc3MSeQoLYWNjdW11bGF0ZWQYAiABKAsyOy5jb3Ntb3MuZGlzdHJpYnV0aW9uLnYxYmV0YTEuVmFsaWRhdG9yQWNjdW11bGF0ZWRDb21taXNzaW9uQhrI3h8A8t4fEnlhbWw6ImFjY3VtdWxhdGVkIlILYWNjdW11bGF0ZWQ6COigHwCIoB8A');
@$core.Deprecated('Use validatorHistoricalRewardsRecordDescriptor instead')
const ValidatorHistoricalRewardsRecord$json = const {
  '1': 'ValidatorHistoricalRewardsRecord',
  '2': const [
    const {'1': 'validator_address', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'validatorAddress'},
    const {'1': 'period', '3': 2, '4': 1, '5': 4, '10': 'period'},
    const {'1': 'rewards', '3': 3, '4': 1, '5': 11, '6': '.cosmos.distribution.v1beta1.ValidatorHistoricalRewards', '8': const {}, '10': 'rewards'},
  ],
  '7': const {},
};

/// Descriptor for `ValidatorHistoricalRewardsRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorHistoricalRewardsRecordDescriptor = $convert.base64Decode('CiBWYWxpZGF0b3JIaXN0b3JpY2FsUmV3YXJkc1JlY29yZBJJChF2YWxpZGF0b3JfYWRkcmVzcxgBIAEoCUIc8t4fGHlhbWw6InZhbGlkYXRvcl9hZGRyZXNzIlIQdmFsaWRhdG9yQWRkcmVzcxIWCgZwZXJpb2QYAiABKARSBnBlcmlvZBJpCgdyZXdhcmRzGAMgASgLMjcuY29zbW9zLmRpc3RyaWJ1dGlvbi52MWJldGExLlZhbGlkYXRvckhpc3RvcmljYWxSZXdhcmRzQhbI3h8A8t4fDnlhbWw6InJld2FyZHMiUgdyZXdhcmRzOgjooB8AiKAfAA==');
@$core.Deprecated('Use validatorCurrentRewardsRecordDescriptor instead')
const ValidatorCurrentRewardsRecord$json = const {
  '1': 'ValidatorCurrentRewardsRecord',
  '2': const [
    const {'1': 'validator_address', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'validatorAddress'},
    const {'1': 'rewards', '3': 2, '4': 1, '5': 11, '6': '.cosmos.distribution.v1beta1.ValidatorCurrentRewards', '8': const {}, '10': 'rewards'},
  ],
  '7': const {},
};

/// Descriptor for `ValidatorCurrentRewardsRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorCurrentRewardsRecordDescriptor = $convert.base64Decode('Ch1WYWxpZGF0b3JDdXJyZW50UmV3YXJkc1JlY29yZBJJChF2YWxpZGF0b3JfYWRkcmVzcxgBIAEoCUIc8t4fGHlhbWw6InZhbGlkYXRvcl9hZGRyZXNzIlIQdmFsaWRhdG9yQWRkcmVzcxJmCgdyZXdhcmRzGAIgASgLMjQuY29zbW9zLmRpc3RyaWJ1dGlvbi52MWJldGExLlZhbGlkYXRvckN1cnJlbnRSZXdhcmRzQhbI3h8A8t4fDnlhbWw6InJld2FyZHMiUgdyZXdhcmRzOgjooB8AiKAfAA==');
@$core.Deprecated('Use delegatorStartingInfoRecordDescriptor instead')
const DelegatorStartingInfoRecord$json = const {
  '1': 'DelegatorStartingInfoRecord',
  '2': const [
    const {'1': 'delegator_address', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'delegatorAddress'},
    const {'1': 'validator_address', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'validatorAddress'},
    const {'1': 'starting_info', '3': 3, '4': 1, '5': 11, '6': '.cosmos.distribution.v1beta1.DelegatorStartingInfo', '8': const {}, '10': 'startingInfo'},
  ],
  '7': const {},
};

/// Descriptor for `DelegatorStartingInfoRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List delegatorStartingInfoRecordDescriptor = $convert.base64Decode('ChtEZWxlZ2F0b3JTdGFydGluZ0luZm9SZWNvcmQSSQoRZGVsZWdhdG9yX2FkZHJlc3MYASABKAlCHPLeHxh5YW1sOiJkZWxlZ2F0b3JfYWRkcmVzcyJSEGRlbGVnYXRvckFkZHJlc3MSSQoRdmFsaWRhdG9yX2FkZHJlc3MYAiABKAlCHPLeHxh5YW1sOiJ2YWxpZGF0b3JfYWRkcmVzcyJSEHZhbGlkYXRvckFkZHJlc3MSdQoNc3RhcnRpbmdfaW5mbxgDIAEoCzIyLmNvc21vcy5kaXN0cmlidXRpb24udjFiZXRhMS5EZWxlZ2F0b3JTdGFydGluZ0luZm9CHMjeHwDy3h8UeWFtbDoic3RhcnRpbmdfaW5mbyJSDHN0YXJ0aW5nSW5mbzoI6KAfAIigHwA=');
@$core.Deprecated('Use validatorSlashEventRecordDescriptor instead')
const ValidatorSlashEventRecord$json = const {
  '1': 'ValidatorSlashEventRecord',
  '2': const [
    const {'1': 'validator_address', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'validatorAddress'},
    const {'1': 'height', '3': 2, '4': 1, '5': 4, '10': 'height'},
    const {'1': 'period', '3': 3, '4': 1, '5': 4, '10': 'period'},
    const {'1': 'validator_slash_event', '3': 4, '4': 1, '5': 11, '6': '.cosmos.distribution.v1beta1.ValidatorSlashEvent', '8': const {}, '10': 'validatorSlashEvent'},
  ],
  '7': const {},
};

/// Descriptor for `ValidatorSlashEventRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorSlashEventRecordDescriptor = $convert.base64Decode('ChlWYWxpZGF0b3JTbGFzaEV2ZW50UmVjb3JkEkkKEXZhbGlkYXRvcl9hZGRyZXNzGAEgASgJQhzy3h8YeWFtbDoidmFsaWRhdG9yX2FkZHJlc3MiUhB2YWxpZGF0b3JBZGRyZXNzEhYKBmhlaWdodBgCIAEoBFIGaGVpZ2h0EhYKBnBlcmlvZBgDIAEoBFIGcGVyaW9kEnoKFXZhbGlkYXRvcl9zbGFzaF9ldmVudBgEIAEoCzIwLmNvc21vcy5kaXN0cmlidXRpb24udjFiZXRhMS5WYWxpZGF0b3JTbGFzaEV2ZW50QhTI3h8A8t4fDHlhbWw6ImV2ZW50IlITdmFsaWRhdG9yU2xhc2hFdmVudDoI6KAfAIigHwA=');
@$core.Deprecated('Use genesisStateDescriptor instead')
const GenesisState$json = const {
  '1': 'GenesisState',
  '2': const [
    const {'1': 'params', '3': 1, '4': 1, '5': 11, '6': '.cosmos.distribution.v1beta1.Params', '8': const {}, '10': 'params'},
    const {'1': 'fee_pool', '3': 2, '4': 1, '5': 11, '6': '.cosmos.distribution.v1beta1.FeePool', '8': const {}, '10': 'feePool'},
    const {'1': 'delegator_withdraw_infos', '3': 3, '4': 3, '5': 11, '6': '.cosmos.distribution.v1beta1.DelegatorWithdrawInfo', '8': const {}, '10': 'delegatorWithdrawInfos'},
    const {'1': 'previous_proposer', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'previousProposer'},
    const {'1': 'outstanding_rewards', '3': 5, '4': 3, '5': 11, '6': '.cosmos.distribution.v1beta1.ValidatorOutstandingRewardsRecord', '8': const {}, '10': 'outstandingRewards'},
    const {'1': 'validator_accumulated_commissions', '3': 6, '4': 3, '5': 11, '6': '.cosmos.distribution.v1beta1.ValidatorAccumulatedCommissionRecord', '8': const {}, '10': 'validatorAccumulatedCommissions'},
    const {'1': 'validator_historical_rewards', '3': 7, '4': 3, '5': 11, '6': '.cosmos.distribution.v1beta1.ValidatorHistoricalRewardsRecord', '8': const {}, '10': 'validatorHistoricalRewards'},
    const {'1': 'validator_current_rewards', '3': 8, '4': 3, '5': 11, '6': '.cosmos.distribution.v1beta1.ValidatorCurrentRewardsRecord', '8': const {}, '10': 'validatorCurrentRewards'},
    const {'1': 'delegator_starting_infos', '3': 9, '4': 3, '5': 11, '6': '.cosmos.distribution.v1beta1.DelegatorStartingInfoRecord', '8': const {}, '10': 'delegatorStartingInfos'},
    const {'1': 'validator_slash_events', '3': 10, '4': 3, '5': 11, '6': '.cosmos.distribution.v1beta1.ValidatorSlashEventRecord', '8': const {}, '10': 'validatorSlashEvents'},
  ],
  '7': const {},
};

/// Descriptor for `GenesisState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genesisStateDescriptor = $convert.base64Decode('CgxHZW5lc2lzU3RhdGUSUgoGcGFyYW1zGAEgASgLMiMuY29zbW9zLmRpc3RyaWJ1dGlvbi52MWJldGExLlBhcmFtc0IVyN4fAPLeHw15YW1sOiJwYXJhbXMiUgZwYXJhbXMSWAoIZmVlX3Bvb2wYAiABKAsyJC5jb3Ntb3MuZGlzdHJpYnV0aW9uLnYxYmV0YTEuRmVlUG9vbEIXyN4fAPLeHw95YW1sOiJmZWVfcG9vbCJSB2ZlZVBvb2wSlQEKGGRlbGVnYXRvcl93aXRoZHJhd19pbmZvcxgDIAMoCzIyLmNvc21vcy5kaXN0cmlidXRpb24udjFiZXRhMS5EZWxlZ2F0b3JXaXRoZHJhd0luZm9CJ8jeHwDy3h8feWFtbDoiZGVsZWdhdG9yX3dpdGhkcmF3X2luZm9zIlIWZGVsZWdhdG9yV2l0aGRyYXdJbmZvcxJJChFwcmV2aW91c19wcm9wb3NlchgEIAEoCUIc8t4fGHlhbWw6InByZXZpb3VzX3Byb3Bvc2VyIlIQcHJldmlvdXNQcm9wb3NlchKTAQoTb3V0c3RhbmRpbmdfcmV3YXJkcxgFIAMoCzI+LmNvc21vcy5kaXN0cmlidXRpb24udjFiZXRhMS5WYWxpZGF0b3JPdXRzdGFuZGluZ1Jld2FyZHNSZWNvcmRCIsjeHwDy3h8aeWFtbDoib3V0c3RhbmRpbmdfcmV3YXJkcyJSEm91dHN0YW5kaW5nUmV3YXJkcxK/AQohdmFsaWRhdG9yX2FjY3VtdWxhdGVkX2NvbW1pc3Npb25zGAYgAygLMkEuY29zbW9zLmRpc3RyaWJ1dGlvbi52MWJldGExLlZhbGlkYXRvckFjY3VtdWxhdGVkQ29tbWlzc2lvblJlY29yZEIwyN4fAPLeHyh5YW1sOiJ2YWxpZGF0b3JfYWNjdW11bGF0ZWRfY29tbWlzc2lvbnMiUh92YWxpZGF0b3JBY2N1bXVsYXRlZENvbW1pc3Npb25zEqwBChx2YWxpZGF0b3JfaGlzdG9yaWNhbF9yZXdhcmRzGAcgAygLMj0uY29zbW9zLmRpc3RyaWJ1dGlvbi52MWJldGExLlZhbGlkYXRvckhpc3RvcmljYWxSZXdhcmRzUmVjb3JkQivI3h8A8t4fI3lhbWw6InZhbGlkYXRvcl9oaXN0b3JpY2FsX3Jld2FyZHMiUhp2YWxpZGF0b3JIaXN0b3JpY2FsUmV3YXJkcxKgAQoZdmFsaWRhdG9yX2N1cnJlbnRfcmV3YXJkcxgIIAMoCzI6LmNvc21vcy5kaXN0cmlidXRpb24udjFiZXRhMS5WYWxpZGF0b3JDdXJyZW50UmV3YXJkc1JlY29yZEIoyN4fAPLeHyB5YW1sOiJ2YWxpZGF0b3JfY3VycmVudF9yZXdhcmRzIlIXdmFsaWRhdG9yQ3VycmVudFJld2FyZHMSmwEKGGRlbGVnYXRvcl9zdGFydGluZ19pbmZvcxgJIAMoCzI4LmNvc21vcy5kaXN0cmlidXRpb24udjFiZXRhMS5EZWxlZ2F0b3JTdGFydGluZ0luZm9SZWNvcmRCJ8jeHwDy3h8feWFtbDoiZGVsZWdhdG9yX3N0YXJ0aW5nX2luZm9zIlIWZGVsZWdhdG9yU3RhcnRpbmdJbmZvcxKTAQoWdmFsaWRhdG9yX3NsYXNoX2V2ZW50cxgKIAMoCzI2LmNvc21vcy5kaXN0cmlidXRpb24udjFiZXRhMS5WYWxpZGF0b3JTbGFzaEV2ZW50UmVjb3JkQiXI3h8A8t4fHXlhbWw6InZhbGlkYXRvcl9zbGFzaF9ldmVudHMiUhR2YWxpZGF0b3JTbGFzaEV2ZW50czoI6KAfAIigHwA=');
