///
//  Generated code. Do not modify.
//  source: cosmos/bank/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use msgSendDescriptor instead')
const MsgSend$json = const {
  '1': 'MsgSend',
  '2': const [
    const {'1': 'from_address', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'fromAddress'},
    const {'1': 'to_address', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'toAddress'},
    const {'1': 'amount', '3': 3, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'amount'},
  ],
  '7': const {},
};

/// Descriptor for `MsgSend`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSendDescriptor = $convert.base64Decode('CgdNc2dTZW5kEjoKDGZyb21fYWRkcmVzcxgBIAEoCUIX8t4fE3lhbWw6ImZyb21fYWRkcmVzcyJSC2Zyb21BZGRyZXNzEjQKCnRvX2FkZHJlc3MYAiABKAlCFfLeHxF5YW1sOiJ0b19hZGRyZXNzIlIJdG9BZGRyZXNzEmMKBmFtb3VudBgDIAMoCzIZLmNvc21vcy5iYXNlLnYxYmV0YTEuQ29pbkIwyN4fAKrfHyhnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkNvaW5zUgZhbW91bnQ6COigHwCIoB8A');
@$core.Deprecated('Use msgSendResponseDescriptor instead')
const MsgSendResponse$json = const {
  '1': 'MsgSendResponse',
};

/// Descriptor for `MsgSendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSendResponseDescriptor = $convert.base64Decode('Cg9Nc2dTZW5kUmVzcG9uc2U=');
@$core.Deprecated('Use msgMultiSendDescriptor instead')
const MsgMultiSend$json = const {
  '1': 'MsgMultiSend',
  '2': const [
    const {'1': 'inputs', '3': 1, '4': 3, '5': 11, '6': '.cosmos.bank.v1beta1.Input', '8': const {}, '10': 'inputs'},
    const {'1': 'outputs', '3': 2, '4': 3, '5': 11, '6': '.cosmos.bank.v1beta1.Output', '8': const {}, '10': 'outputs'},
  ],
  '7': const {},
};

/// Descriptor for `MsgMultiSend`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgMultiSendDescriptor = $convert.base64Decode('CgxNc2dNdWx0aVNlbmQSOAoGaW5wdXRzGAEgAygLMhouY29zbW9zLmJhbmsudjFiZXRhMS5JbnB1dEIEyN4fAFIGaW5wdXRzEjsKB291dHB1dHMYAiADKAsyGy5jb3Ntb3MuYmFuay52MWJldGExLk91dHB1dEIEyN4fAFIHb3V0cHV0czoE6KAfAA==');
@$core.Deprecated('Use msgMultiSendResponseDescriptor instead')
const MsgMultiSendResponse$json = const {
  '1': 'MsgMultiSendResponse',
};

/// Descriptor for `MsgMultiSendResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgMultiSendResponseDescriptor = $convert.base64Decode('ChRNc2dNdWx0aVNlbmRSZXNwb25zZQ==');
