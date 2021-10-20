///
//  Generated code. Do not modify.
//  source: cosmos/authz/v1beta1/authz.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use genericAuthorizationDescriptor instead')
const GenericAuthorization$json = const {
  '1': 'GenericAuthorization',
  '2': const [
    const {'1': 'msg', '3': 1, '4': 1, '5': 9, '10': 'msg'},
  ],
  '7': const {},
};

/// Descriptor for `GenericAuthorization`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genericAuthorizationDescriptor = $convert.base64Decode('ChRHZW5lcmljQXV0aG9yaXphdGlvbhIQCgNtc2cYASABKAlSA21zZzoR0rQtDUF1dGhvcml6YXRpb24=');
@$core.Deprecated('Use grantDescriptor instead')
const Grant$json = const {
  '1': 'Grant',
  '2': const [
    const {'1': 'authorization', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Any', '8': const {}, '10': 'authorization'},
    const {'1': 'expiration', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'expiration'},
  ],
};

/// Descriptor for `Grant`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List grantDescriptor = $convert.base64Decode('CgVHcmFudBJNCg1hdXRob3JpemF0aW9uGAEgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueUIRyrQtDUF1dGhvcml6YXRpb25SDWF1dGhvcml6YXRpb24SRAoKZXhwaXJhdGlvbhgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBCCJDfHwHI3h8AUgpleHBpcmF0aW9u');
