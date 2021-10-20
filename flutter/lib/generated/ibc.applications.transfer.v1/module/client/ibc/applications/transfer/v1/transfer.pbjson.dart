///
//  Generated code. Do not modify.
//  source: ibc/applications/transfer/v1/transfer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use fungibleTokenPacketDataDescriptor instead')
const FungibleTokenPacketData$json = const {
  '1': 'FungibleTokenPacketData',
  '2': const [
    const {'1': 'denom', '3': 1, '4': 1, '5': 9, '10': 'denom'},
    const {'1': 'amount', '3': 2, '4': 1, '5': 4, '10': 'amount'},
    const {'1': 'sender', '3': 3, '4': 1, '5': 9, '10': 'sender'},
    const {'1': 'receiver', '3': 4, '4': 1, '5': 9, '10': 'receiver'},
  ],
};

/// Descriptor for `FungibleTokenPacketData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fungibleTokenPacketDataDescriptor = $convert.base64Decode('ChdGdW5naWJsZVRva2VuUGFja2V0RGF0YRIUCgVkZW5vbRgBIAEoCVIFZGVub20SFgoGYW1vdW50GAIgASgEUgZhbW91bnQSFgoGc2VuZGVyGAMgASgJUgZzZW5kZXISGgoIcmVjZWl2ZXIYBCABKAlSCHJlY2VpdmVy');
@$core.Deprecated('Use denomTraceDescriptor instead')
const DenomTrace$json = const {
  '1': 'DenomTrace',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'base_denom', '3': 2, '4': 1, '5': 9, '10': 'baseDenom'},
  ],
};

/// Descriptor for `DenomTrace`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List denomTraceDescriptor = $convert.base64Decode('CgpEZW5vbVRyYWNlEhIKBHBhdGgYASABKAlSBHBhdGgSHQoKYmFzZV9kZW5vbRgCIAEoCVIJYmFzZURlbm9t');
@$core.Deprecated('Use paramsDescriptor instead')
const Params$json = const {
  '1': 'Params',
  '2': const [
    const {'1': 'send_enabled', '3': 1, '4': 1, '5': 8, '8': const {}, '10': 'sendEnabled'},
    const {'1': 'receive_enabled', '3': 2, '4': 1, '5': 8, '8': const {}, '10': 'receiveEnabled'},
  ],
};

/// Descriptor for `Params`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paramsDescriptor = $convert.base64Decode('CgZQYXJhbXMSOgoMc2VuZF9lbmFibGVkGAEgASgIQhfy3h8TeWFtbDoic2VuZF9lbmFibGVkIlILc2VuZEVuYWJsZWQSQwoPcmVjZWl2ZV9lbmFibGVkGAIgASgIQhry3h8WeWFtbDoicmVjZWl2ZV9lbmFibGVkIlIOcmVjZWl2ZUVuYWJsZWQ=');
