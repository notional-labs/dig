///
//  Generated code. Do not modify.
//  source: cosmos/slashing/v1beta1/genesis.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use genesisStateDescriptor instead')
const GenesisState$json = const {
  '1': 'GenesisState',
  '2': const [
    const {'1': 'params', '3': 1, '4': 1, '5': 11, '6': '.cosmos.slashing.v1beta1.Params', '8': const {}, '10': 'params'},
    const {'1': 'signing_infos', '3': 2, '4': 3, '5': 11, '6': '.cosmos.slashing.v1beta1.SigningInfo', '8': const {}, '10': 'signingInfos'},
    const {'1': 'missed_blocks', '3': 3, '4': 3, '5': 11, '6': '.cosmos.slashing.v1beta1.ValidatorMissedBlocks', '8': const {}, '10': 'missedBlocks'},
  ],
};

/// Descriptor for `GenesisState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genesisStateDescriptor = $convert.base64Decode('CgxHZW5lc2lzU3RhdGUSPQoGcGFyYW1zGAEgASgLMh8uY29zbW9zLnNsYXNoaW5nLnYxYmV0YTEuUGFyYW1zQgTI3h8AUgZwYXJhbXMSZwoNc2lnbmluZ19pbmZvcxgCIAMoCzIkLmNvc21vcy5zbGFzaGluZy52MWJldGExLlNpZ25pbmdJbmZvQhzy3h8UeWFtbDoic2lnbmluZ19pbmZvcyLI3h8AUgxzaWduaW5nSW5mb3MScQoNbWlzc2VkX2Jsb2NrcxgDIAMoCzIuLmNvc21vcy5zbGFzaGluZy52MWJldGExLlZhbGlkYXRvck1pc3NlZEJsb2Nrc0Ic8t4fFHlhbWw6Im1pc3NlZF9ibG9ja3MiyN4fAFIMbWlzc2VkQmxvY2tz');
@$core.Deprecated('Use signingInfoDescriptor instead')
const SigningInfo$json = const {
  '1': 'SigningInfo',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'validator_signing_info', '3': 2, '4': 1, '5': 11, '6': '.cosmos.slashing.v1beta1.ValidatorSigningInfo', '8': const {}, '10': 'validatorSigningInfo'},
  ],
};

/// Descriptor for `SigningInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingInfoDescriptor = $convert.base64Decode('CgtTaWduaW5nSW5mbxIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNzEooBChZ2YWxpZGF0b3Jfc2lnbmluZ19pbmZvGAIgASgLMi0uY29zbW9zLnNsYXNoaW5nLnYxYmV0YTEuVmFsaWRhdG9yU2lnbmluZ0luZm9CJcjeHwDy3h8deWFtbDoidmFsaWRhdG9yX3NpZ25pbmdfaW5mbyJSFHZhbGlkYXRvclNpZ25pbmdJbmZv');
@$core.Deprecated('Use validatorMissedBlocksDescriptor instead')
const ValidatorMissedBlocks$json = const {
  '1': 'ValidatorMissedBlocks',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'missed_blocks', '3': 2, '4': 3, '5': 11, '6': '.cosmos.slashing.v1beta1.MissedBlock', '8': const {}, '10': 'missedBlocks'},
  ],
};

/// Descriptor for `ValidatorMissedBlocks`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorMissedBlocksDescriptor = $convert.base64Decode('ChVWYWxpZGF0b3JNaXNzZWRCbG9ja3MSGAoHYWRkcmVzcxgBIAEoCVIHYWRkcmVzcxJnCg1taXNzZWRfYmxvY2tzGAIgAygLMiQuY29zbW9zLnNsYXNoaW5nLnYxYmV0YTEuTWlzc2VkQmxvY2tCHMjeHwDy3h8UeWFtbDoibWlzc2VkX2Jsb2NrcyJSDG1pc3NlZEJsb2Nrcw==');
@$core.Deprecated('Use missedBlockDescriptor instead')
const MissedBlock$json = const {
  '1': 'MissedBlock',
  '2': const [
    const {'1': 'index', '3': 1, '4': 1, '5': 3, '10': 'index'},
    const {'1': 'missed', '3': 2, '4': 1, '5': 8, '10': 'missed'},
  ],
};

/// Descriptor for `MissedBlock`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List missedBlockDescriptor = $convert.base64Decode('CgtNaXNzZWRCbG9jaxIUCgVpbmRleBgBIAEoA1IFaW5kZXgSFgoGbWlzc2VkGAIgASgIUgZtaXNzZWQ=');
