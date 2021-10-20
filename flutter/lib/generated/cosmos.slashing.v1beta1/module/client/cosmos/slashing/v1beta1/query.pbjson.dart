///
//  Generated code. Do not modify.
//  source: cosmos/slashing/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use queryParamsRequestDescriptor instead')
const QueryParamsRequest$json = const {
  '1': 'QueryParamsRequest',
};

/// Descriptor for `QueryParamsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsRequestDescriptor = $convert.base64Decode('ChJRdWVyeVBhcmFtc1JlcXVlc3Q=');
@$core.Deprecated('Use queryParamsResponseDescriptor instead')
const QueryParamsResponse$json = const {
  '1': 'QueryParamsResponse',
  '2': const [
    const {'1': 'params', '3': 1, '4': 1, '5': 11, '6': '.cosmos.slashing.v1beta1.Params', '8': const {}, '10': 'params'},
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode('ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEj0KBnBhcmFtcxgBIAEoCzIfLmNvc21vcy5zbGFzaGluZy52MWJldGExLlBhcmFtc0IEyN4fAFIGcGFyYW1z');
@$core.Deprecated('Use querySigningInfoRequestDescriptor instead')
const QuerySigningInfoRequest$json = const {
  '1': 'QuerySigningInfoRequest',
  '2': const [
    const {'1': 'cons_address', '3': 1, '4': 1, '5': 9, '10': 'consAddress'},
  ],
};

/// Descriptor for `QuerySigningInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySigningInfoRequestDescriptor = $convert.base64Decode('ChdRdWVyeVNpZ25pbmdJbmZvUmVxdWVzdBIhCgxjb25zX2FkZHJlc3MYASABKAlSC2NvbnNBZGRyZXNz');
@$core.Deprecated('Use querySigningInfoResponseDescriptor instead')
const QuerySigningInfoResponse$json = const {
  '1': 'QuerySigningInfoResponse',
  '2': const [
    const {'1': 'val_signing_info', '3': 1, '4': 1, '5': 11, '6': '.cosmos.slashing.v1beta1.ValidatorSigningInfo', '8': const {}, '10': 'valSigningInfo'},
  ],
};

/// Descriptor for `QuerySigningInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySigningInfoResponseDescriptor = $convert.base64Decode('ChhRdWVyeVNpZ25pbmdJbmZvUmVzcG9uc2USXQoQdmFsX3NpZ25pbmdfaW5mbxgBIAEoCzItLmNvc21vcy5zbGFzaGluZy52MWJldGExLlZhbGlkYXRvclNpZ25pbmdJbmZvQgTI3h8AUg52YWxTaWduaW5nSW5mbw==');
@$core.Deprecated('Use querySigningInfosRequestDescriptor instead')
const QuerySigningInfosRequest$json = const {
  '1': 'QuerySigningInfosRequest',
  '2': const [
    const {'1': 'pagination', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QuerySigningInfosRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySigningInfosRequestDescriptor = $convert.base64Decode('ChhRdWVyeVNpZ25pbmdJbmZvc1JlcXVlc3QSRgoKcGFnaW5hdGlvbhgBIAEoCzImLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlcXVlc3RSCnBhZ2luYXRpb24=');
@$core.Deprecated('Use querySigningInfosResponseDescriptor instead')
const QuerySigningInfosResponse$json = const {
  '1': 'QuerySigningInfosResponse',
  '2': const [
    const {'1': 'info', '3': 1, '4': 3, '5': 11, '6': '.cosmos.slashing.v1beta1.ValidatorSigningInfo', '8': const {}, '10': 'info'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QuerySigningInfosResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySigningInfosResponseDescriptor = $convert.base64Decode('ChlRdWVyeVNpZ25pbmdJbmZvc1Jlc3BvbnNlEkcKBGluZm8YASADKAsyLS5jb3Ntb3Muc2xhc2hpbmcudjFiZXRhMS5WYWxpZGF0b3JTaWduaW5nSW5mb0IEyN4fAFIEaW5mbxJHCgpwYWdpbmF0aW9uGAIgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
