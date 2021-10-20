///
//  Generated code. Do not modify.
//  source: cosmos/bank/v1beta1/bank.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use paramsDescriptor instead')
const Params$json = const {
  '1': 'Params',
  '2': const [
    const {'1': 'send_enabled', '3': 1, '4': 3, '5': 11, '6': '.cosmos.bank.v1beta1.SendEnabled', '8': const {}, '10': 'sendEnabled'},
    const {'1': 'default_send_enabled', '3': 2, '4': 1, '5': 8, '8': const {}, '10': 'defaultSendEnabled'},
  ],
  '7': const {},
};

/// Descriptor for `Params`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paramsDescriptor = $convert.base64Decode('CgZQYXJhbXMSZgoMc2VuZF9lbmFibGVkGAEgAygLMiAuY29zbW9zLmJhbmsudjFiZXRhMS5TZW5kRW5hYmxlZEIh8t4fHXlhbWw6InNlbmRfZW5hYmxlZCxvbWl0ZW1wdHkiUgtzZW5kRW5hYmxlZBJbChRkZWZhdWx0X3NlbmRfZW5hYmxlZBgCIAEoCEIp8t4fJXlhbWw6ImRlZmF1bHRfc2VuZF9lbmFibGVkLG9taXRlbXB0eSJSEmRlZmF1bHRTZW5kRW5hYmxlZDoEmKAfAA==');
@$core.Deprecated('Use sendEnabledDescriptor instead')
const SendEnabled$json = const {
  '1': 'SendEnabled',
  '2': const [
    const {'1': 'denom', '3': 1, '4': 1, '5': 9, '10': 'denom'},
    const {'1': 'enabled', '3': 2, '4': 1, '5': 8, '10': 'enabled'},
  ],
  '7': const {},
};

/// Descriptor for `SendEnabled`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendEnabledDescriptor = $convert.base64Decode('CgtTZW5kRW5hYmxlZBIUCgVkZW5vbRgBIAEoCVIFZGVub20SGAoHZW5hYmxlZBgCIAEoCFIHZW5hYmxlZDoI6KAfAZigHwA=');
@$core.Deprecated('Use inputDescriptor instead')
const Input$json = const {
  '1': 'Input',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'coins', '3': 2, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'coins'},
  ],
  '7': const {},
};

/// Descriptor for `Input`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputDescriptor = $convert.base64Decode('CgVJbnB1dBIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNzEmEKBWNvaW5zGAIgAygLMhkuY29zbW9zLmJhc2UudjFiZXRhMS5Db2luQjDI3h8Aqt8fKGdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuQ29pbnNSBWNvaW5zOgjooB8AiKAfAA==');
@$core.Deprecated('Use outputDescriptor instead')
const Output$json = const {
  '1': 'Output',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'coins', '3': 2, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'coins'},
  ],
  '7': const {},
};

/// Descriptor for `Output`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outputDescriptor = $convert.base64Decode('CgZPdXRwdXQSGAoHYWRkcmVzcxgBIAEoCVIHYWRkcmVzcxJhCgVjb2lucxgCIAMoCzIZLmNvc21vcy5iYXNlLnYxYmV0YTEuQ29pbkIwyN4fAKrfHyhnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkNvaW5zUgVjb2luczoI6KAfAIigHwA=');
@$core.Deprecated('Use supplyDescriptor instead')
const Supply$json = const {
  '1': 'Supply',
  '2': const [
    const {'1': 'total', '3': 1, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'total'},
  ],
  '7': const {'3': true},
};

/// Descriptor for `Supply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplyDescriptor = $convert.base64Decode('CgZTdXBwbHkSYQoFdG90YWwYASADKAsyGS5jb3Ntb3MuYmFzZS52MWJldGExLkNvaW5CMMjeHwCq3x8oZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5Db2luc1IFdG90YWw6RhgB6KAfAYigHwDStC04KmdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsveC9iYW5rL2xlZ2FjeS92MDQwLlN1cHBseUk=');
@$core.Deprecated('Use denomUnitDescriptor instead')
const DenomUnit$json = const {
  '1': 'DenomUnit',
  '2': const [
    const {'1': 'denom', '3': 1, '4': 1, '5': 9, '10': 'denom'},
    const {'1': 'exponent', '3': 2, '4': 1, '5': 13, '10': 'exponent'},
    const {'1': 'aliases', '3': 3, '4': 3, '5': 9, '10': 'aliases'},
  ],
};

/// Descriptor for `DenomUnit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List denomUnitDescriptor = $convert.base64Decode('CglEZW5vbVVuaXQSFAoFZGVub20YASABKAlSBWRlbm9tEhoKCGV4cG9uZW50GAIgASgNUghleHBvbmVudBIYCgdhbGlhc2VzGAMgAygJUgdhbGlhc2Vz');
@$core.Deprecated('Use metadataDescriptor instead')
const Metadata$json = const {
  '1': 'Metadata',
  '2': const [
    const {'1': 'description', '3': 1, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'denom_units', '3': 2, '4': 3, '5': 11, '6': '.cosmos.bank.v1beta1.DenomUnit', '10': 'denomUnits'},
    const {'1': 'base', '3': 3, '4': 1, '5': 9, '10': 'base'},
    const {'1': 'display', '3': 4, '4': 1, '5': 9, '10': 'display'},
    const {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'symbol', '3': 6, '4': 1, '5': 9, '10': 'symbol'},
  ],
};

/// Descriptor for `Metadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List metadataDescriptor = $convert.base64Decode('CghNZXRhZGF0YRIgCgtkZXNjcmlwdGlvbhgBIAEoCVILZGVzY3JpcHRpb24SPwoLZGVub21fdW5pdHMYAiADKAsyHi5jb3Ntb3MuYmFuay52MWJldGExLkRlbm9tVW5pdFIKZGVub21Vbml0cxISCgRiYXNlGAMgASgJUgRiYXNlEhgKB2Rpc3BsYXkYBCABKAlSB2Rpc3BsYXkSEgoEbmFtZRgFIAEoCVIEbmFtZRIWCgZzeW1ib2wYBiABKAlSBnN5bWJvbA==');
