///
//  Generated code. Do not modify.
//  source: ibc/applications/transfer/v1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use msgTransferDescriptor instead')
const MsgTransfer$json = const {
  '1': 'MsgTransfer',
  '2': const [
    const {'1': 'source_port', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'sourcePort'},
    const {'1': 'source_channel', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'sourceChannel'},
    const {'1': 'token', '3': 3, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'token'},
    const {'1': 'sender', '3': 4, '4': 1, '5': 9, '10': 'sender'},
    const {'1': 'receiver', '3': 5, '4': 1, '5': 9, '10': 'receiver'},
    const {'1': 'timeout_height', '3': 6, '4': 1, '5': 11, '6': '.ibc.core.client.v1.Height', '8': const {}, '10': 'timeoutHeight'},
    const {'1': 'timeout_timestamp', '3': 7, '4': 1, '5': 4, '8': const {}, '10': 'timeoutTimestamp'},
  ],
  '7': const {},
};

/// Descriptor for `MsgTransfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgTransferDescriptor = $convert.base64Decode('CgtNc2dUcmFuc2ZlchI3Cgtzb3VyY2VfcG9ydBgBIAEoCUIW8t4fEnlhbWw6InNvdXJjZV9wb3J0IlIKc291cmNlUG9ydBJACg5zb3VyY2VfY2hhbm5lbBgCIAEoCUIZ8t4fFXlhbWw6InNvdXJjZV9jaGFubmVsIlINc291cmNlQ2hhbm5lbBI1CgV0b2tlbhgDIAEoCzIZLmNvc21vcy5iYXNlLnYxYmV0YTEuQ29pbkIEyN4fAFIFdG9rZW4SFgoGc2VuZGVyGAQgASgJUgZzZW5kZXISGgoIcmVjZWl2ZXIYBSABKAlSCHJlY2VpdmVyEmAKDnRpbWVvdXRfaGVpZ2h0GAYgASgLMhouaWJjLmNvcmUuY2xpZW50LnYxLkhlaWdodEId8t4fFXlhbWw6InRpbWVvdXRfaGVpZ2h0IsjeHwBSDXRpbWVvdXRIZWlnaHQSSQoRdGltZW91dF90aW1lc3RhbXAYByABKARCHPLeHxh5YW1sOiJ0aW1lb3V0X3RpbWVzdGFtcCJSEHRpbWVvdXRUaW1lc3RhbXA6COigHwCIoB8A');
@$core.Deprecated('Use msgTransferResponseDescriptor instead')
const MsgTransferResponse$json = const {
  '1': 'MsgTransferResponse',
};

/// Descriptor for `MsgTransferResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgTransferResponseDescriptor = $convert.base64Decode('ChNNc2dUcmFuc2ZlclJlc3BvbnNl');
