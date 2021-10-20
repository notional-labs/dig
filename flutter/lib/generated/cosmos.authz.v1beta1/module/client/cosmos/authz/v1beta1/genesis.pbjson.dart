///
//  Generated code. Do not modify.
//  source: cosmos/authz/v1beta1/genesis.proto
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
    const {'1': 'authorization', '3': 1, '4': 3, '5': 11, '6': '.cosmos.authz.v1beta1.GrantAuthorization', '8': const {}, '10': 'authorization'},
  ],
};

/// Descriptor for `GenesisState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genesisStateDescriptor = $convert.base64Decode('CgxHZW5lc2lzU3RhdGUSVAoNYXV0aG9yaXphdGlvbhgBIAMoCzIoLmNvc21vcy5hdXRoei52MWJldGExLkdyYW50QXV0aG9yaXphdGlvbkIEyN4fAFINYXV0aG9yaXphdGlvbg==');
@$core.Deprecated('Use grantAuthorizationDescriptor instead')
const GrantAuthorization$json = const {
  '1': 'GrantAuthorization',
  '2': const [
    const {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    const {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
    const {'1': 'authorization', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Any', '8': const {}, '10': 'authorization'},
    const {'1': 'expiration', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'expiration'},
  ],
};

/// Descriptor for `GrantAuthorization`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List grantAuthorizationDescriptor = $convert.base64Decode('ChJHcmFudEF1dGhvcml6YXRpb24SGAoHZ3JhbnRlchgBIAEoCVIHZ3JhbnRlchIYCgdncmFudGVlGAIgASgJUgdncmFudGVlEk0KDWF1dGhvcml6YXRpb24YAyABKAsyFC5nb29nbGUucHJvdG9idWYuQW55QhHKtC0NQXV0aG9yaXphdGlvblINYXV0aG9yaXphdGlvbhJECgpleHBpcmF0aW9uGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIIyN4fAJDfHwFSCmV4cGlyYXRpb24=');
