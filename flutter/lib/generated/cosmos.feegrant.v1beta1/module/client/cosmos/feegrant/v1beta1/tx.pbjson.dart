///
//  Generated code. Do not modify.
//  source: cosmos/feegrant/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use msgGrantAllowanceDescriptor instead')
const MsgGrantAllowance$json = const {
  '1': 'MsgGrantAllowance',
  '2': const [
    const {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    const {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
    const {'1': 'allowance', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Any', '8': const {}, '10': 'allowance'},
  ],
};

/// Descriptor for `MsgGrantAllowance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgGrantAllowanceDescriptor = $convert.base64Decode('ChFNc2dHcmFudEFsbG93YW5jZRIYCgdncmFudGVyGAEgASgJUgdncmFudGVyEhgKB2dyYW50ZWUYAiABKAlSB2dyYW50ZWUSRQoJYWxsb3dhbmNlGAMgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueUIRyrQtDUZlZUFsbG93YW5jZUlSCWFsbG93YW5jZQ==');
@$core.Deprecated('Use msgGrantAllowanceResponseDescriptor instead')
const MsgGrantAllowanceResponse$json = const {
  '1': 'MsgGrantAllowanceResponse',
};

/// Descriptor for `MsgGrantAllowanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgGrantAllowanceResponseDescriptor = $convert.base64Decode('ChlNc2dHcmFudEFsbG93YW5jZVJlc3BvbnNl');
@$core.Deprecated('Use msgRevokeAllowanceDescriptor instead')
const MsgRevokeAllowance$json = const {
  '1': 'MsgRevokeAllowance',
  '2': const [
    const {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    const {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
  ],
};

/// Descriptor for `MsgRevokeAllowance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgRevokeAllowanceDescriptor = $convert.base64Decode('ChJNc2dSZXZva2VBbGxvd2FuY2USGAoHZ3JhbnRlchgBIAEoCVIHZ3JhbnRlchIYCgdncmFudGVlGAIgASgJUgdncmFudGVl');
@$core.Deprecated('Use msgRevokeAllowanceResponseDescriptor instead')
const MsgRevokeAllowanceResponse$json = const {
  '1': 'MsgRevokeAllowanceResponse',
};

/// Descriptor for `MsgRevokeAllowanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgRevokeAllowanceResponseDescriptor = $convert.base64Decode('ChpNc2dSZXZva2VBbGxvd2FuY2VSZXNwb25zZQ==');
