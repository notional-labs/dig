///
//  Generated code. Do not modify.
//  source: tendermint/types/params.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use consensusParamsDescriptor instead')
const ConsensusParams$json = const {
  '1': 'ConsensusParams',
  '2': const [
    const {'1': 'block', '3': 1, '4': 1, '5': 11, '6': '.tendermint.types.BlockParams', '8': const {}, '10': 'block'},
    const {'1': 'evidence', '3': 2, '4': 1, '5': 11, '6': '.tendermint.types.EvidenceParams', '8': const {}, '10': 'evidence'},
    const {'1': 'validator', '3': 3, '4': 1, '5': 11, '6': '.tendermint.types.ValidatorParams', '8': const {}, '10': 'validator'},
    const {'1': 'version', '3': 4, '4': 1, '5': 11, '6': '.tendermint.types.VersionParams', '8': const {}, '10': 'version'},
  ],
};

/// Descriptor for `ConsensusParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List consensusParamsDescriptor = $convert.base64Decode('Cg9Db25zZW5zdXNQYXJhbXMSOQoFYmxvY2sYASABKAsyHS50ZW5kZXJtaW50LnR5cGVzLkJsb2NrUGFyYW1zQgTI3h8AUgVibG9jaxJCCghldmlkZW5jZRgCIAEoCzIgLnRlbmRlcm1pbnQudHlwZXMuRXZpZGVuY2VQYXJhbXNCBMjeHwBSCGV2aWRlbmNlEkUKCXZhbGlkYXRvchgDIAEoCzIhLnRlbmRlcm1pbnQudHlwZXMuVmFsaWRhdG9yUGFyYW1zQgTI3h8AUgl2YWxpZGF0b3ISPwoHdmVyc2lvbhgEIAEoCzIfLnRlbmRlcm1pbnQudHlwZXMuVmVyc2lvblBhcmFtc0IEyN4fAFIHdmVyc2lvbg==');
@$core.Deprecated('Use blockParamsDescriptor instead')
const BlockParams$json = const {
  '1': 'BlockParams',
  '2': const [
    const {'1': 'max_bytes', '3': 1, '4': 1, '5': 3, '10': 'maxBytes'},
    const {'1': 'max_gas', '3': 2, '4': 1, '5': 3, '10': 'maxGas'},
    const {'1': 'time_iota_ms', '3': 3, '4': 1, '5': 3, '10': 'timeIotaMs'},
  ],
};

/// Descriptor for `BlockParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockParamsDescriptor = $convert.base64Decode('CgtCbG9ja1BhcmFtcxIbCgltYXhfYnl0ZXMYASABKANSCG1heEJ5dGVzEhcKB21heF9nYXMYAiABKANSBm1heEdhcxIgCgx0aW1lX2lvdGFfbXMYAyABKANSCnRpbWVJb3RhTXM=');
@$core.Deprecated('Use evidenceParamsDescriptor instead')
const EvidenceParams$json = const {
  '1': 'EvidenceParams',
  '2': const [
    const {'1': 'max_age_num_blocks', '3': 1, '4': 1, '5': 3, '10': 'maxAgeNumBlocks'},
    const {'1': 'max_age_duration', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '8': const {}, '10': 'maxAgeDuration'},
    const {'1': 'max_bytes', '3': 3, '4': 1, '5': 3, '10': 'maxBytes'},
  ],
};

/// Descriptor for `EvidenceParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List evidenceParamsDescriptor = $convert.base64Decode('Cg5FdmlkZW5jZVBhcmFtcxIrChJtYXhfYWdlX251bV9ibG9ja3MYASABKANSD21heEFnZU51bUJsb2NrcxJNChBtYXhfYWdlX2R1cmF0aW9uGAIgASgLMhkuZ29vZ2xlLnByb3RvYnVmLkR1cmF0aW9uQgjI3h8AmN8fAVIObWF4QWdlRHVyYXRpb24SGwoJbWF4X2J5dGVzGAMgASgDUghtYXhCeXRlcw==');
@$core.Deprecated('Use validatorParamsDescriptor instead')
const ValidatorParams$json = const {
  '1': 'ValidatorParams',
  '2': const [
    const {'1': 'pub_key_types', '3': 1, '4': 3, '5': 9, '10': 'pubKeyTypes'},
  ],
  '7': const {},
};

/// Descriptor for `ValidatorParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorParamsDescriptor = $convert.base64Decode('Cg9WYWxpZGF0b3JQYXJhbXMSIgoNcHViX2tleV90eXBlcxgBIAMoCVILcHViS2V5VHlwZXM6CLigHwHooB8B');
@$core.Deprecated('Use versionParamsDescriptor instead')
const VersionParams$json = const {
  '1': 'VersionParams',
  '2': const [
    const {'1': 'app_version', '3': 1, '4': 1, '5': 4, '10': 'appVersion'},
  ],
  '7': const {},
};

/// Descriptor for `VersionParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionParamsDescriptor = $convert.base64Decode('Cg1WZXJzaW9uUGFyYW1zEh8KC2FwcF92ZXJzaW9uGAEgASgEUgphcHBWZXJzaW9uOgi4oB8B6KAfAQ==');
@$core.Deprecated('Use hashedParamsDescriptor instead')
const HashedParams$json = const {
  '1': 'HashedParams',
  '2': const [
    const {'1': 'block_max_bytes', '3': 1, '4': 1, '5': 3, '10': 'blockMaxBytes'},
    const {'1': 'block_max_gas', '3': 2, '4': 1, '5': 3, '10': 'blockMaxGas'},
  ],
};

/// Descriptor for `HashedParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hashedParamsDescriptor = $convert.base64Decode('CgxIYXNoZWRQYXJhbXMSJgoPYmxvY2tfbWF4X2J5dGVzGAEgASgDUg1ibG9ja01heEJ5dGVzEiIKDWJsb2NrX21heF9nYXMYAiABKANSC2Jsb2NrTWF4R2Fz');
