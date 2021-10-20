///
//  Generated code. Do not modify.
//  source: cosmos/base/v1beta1/coin.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use coinDescriptor instead')
const Coin$json = const {
  '1': 'Coin',
  '2': const [
    const {'1': 'denom', '3': 1, '4': 1, '5': 9, '10': 'denom'},
    const {'1': 'amount', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'amount'},
  ],
  '7': const {},
};

/// Descriptor for `Coin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coinDescriptor = $convert.base64Decode('CgRDb2luEhQKBWRlbm9tGAEgASgJUgVkZW5vbRIjCgZhbW91bnQYAiABKAlCC9reHwNJbnTI3h8AUgZhbW91bnQ6BOigHwE=');
@$core.Deprecated('Use decCoinDescriptor instead')
const DecCoin$json = const {
  '1': 'DecCoin',
  '2': const [
    const {'1': 'denom', '3': 1, '4': 1, '5': 9, '10': 'denom'},
    const {'1': 'amount', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'amount'},
  ],
  '7': const {},
};

/// Descriptor for `DecCoin`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List decCoinDescriptor = $convert.base64Decode('CgdEZWNDb2luEhQKBWRlbm9tGAEgASgJUgVkZW5vbRIjCgZhbW91bnQYAiABKAlCC9reHwNEZWPI3h8AUgZhbW91bnQ6BOigHwE=');
@$core.Deprecated('Use intProtoDescriptor instead')
const IntProto$json = const {
  '1': 'IntProto',
  '2': const [
    const {'1': 'int', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'int'},
  ],
};

/// Descriptor for `IntProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List intProtoDescriptor = $convert.base64Decode('CghJbnRQcm90bxIdCgNpbnQYASABKAlCC9reHwNJbnTI3h8AUgNpbnQ=');
@$core.Deprecated('Use decProtoDescriptor instead')
const DecProto$json = const {
  '1': 'DecProto',
  '2': const [
    const {'1': 'dec', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'dec'},
  ],
};

/// Descriptor for `DecProto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List decProtoDescriptor = $convert.base64Decode('CghEZWNQcm90bxIdCgNkZWMYASABKAlCC9reHwNEZWPI3h8AUgNkZWM=');
