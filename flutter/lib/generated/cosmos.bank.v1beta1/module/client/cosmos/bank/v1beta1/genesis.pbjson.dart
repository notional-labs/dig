///
//  Generated code. Do not modify.
//  source: cosmos/bank/v1beta1/genesis.proto
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
    const {'1': 'params', '3': 1, '4': 1, '5': 11, '6': '.cosmos.bank.v1beta1.Params', '8': const {}, '10': 'params'},
    const {'1': 'balances', '3': 2, '4': 3, '5': 11, '6': '.cosmos.bank.v1beta1.Balance', '8': const {}, '10': 'balances'},
    const {'1': 'supply', '3': 3, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'supply'},
    const {'1': 'denom_metadata', '3': 4, '4': 3, '5': 11, '6': '.cosmos.bank.v1beta1.Metadata', '8': const {}, '10': 'denomMetadata'},
  ],
};

/// Descriptor for `GenesisState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List genesisStateDescriptor = $convert.base64Decode('CgxHZW5lc2lzU3RhdGUSOQoGcGFyYW1zGAEgASgLMhsuY29zbW9zLmJhbmsudjFiZXRhMS5QYXJhbXNCBMjeHwBSBnBhcmFtcxI+CghiYWxhbmNlcxgCIAMoCzIcLmNvc21vcy5iYW5rLnYxYmV0YTEuQmFsYW5jZUIEyN4fAFIIYmFsYW5jZXMSYwoGc3VwcGx5GAMgAygLMhkuY29zbW9zLmJhc2UudjFiZXRhMS5Db2luQjCq3x8oZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5Db2luc8jeHwBSBnN1cHBseRJjCg5kZW5vbV9tZXRhZGF0YRgEIAMoCzIdLmNvc21vcy5iYW5rLnYxYmV0YTEuTWV0YWRhdGFCHfLeHxV5YW1sOiJkZW5vbV9tZXRhZGF0YSLI3h8AUg1kZW5vbU1ldGFkYXRh');
@$core.Deprecated('Use balanceDescriptor instead')
const Balance$json = const {
  '1': 'Balance',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'coins', '3': 2, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'coins'},
  ],
  '7': const {},
};

/// Descriptor for `Balance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List balanceDescriptor = $convert.base64Decode('CgdCYWxhbmNlEhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3MSYQoFY29pbnMYAiADKAsyGS5jb3Ntb3MuYmFzZS52MWJldGExLkNvaW5CMKrfHyhnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkNvaW5zyN4fAFIFY29pbnM6COigHwCIoB8A');
