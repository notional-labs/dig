///
//  Generated code. Do not modify.
//  source: cosmos/bank/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use queryBalanceRequestDescriptor instead')
const QueryBalanceRequest$json = const {
  '1': 'QueryBalanceRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'denom', '3': 2, '4': 1, '5': 9, '10': 'denom'},
  ],
  '7': const {},
};

/// Descriptor for `QueryBalanceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBalanceRequestDescriptor = $convert.base64Decode('ChNRdWVyeUJhbGFuY2VSZXF1ZXN0EhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3MSFAoFZGVub20YAiABKAlSBWRlbm9tOgjooB8AiKAfAA==');
@$core.Deprecated('Use queryBalanceResponseDescriptor instead')
const QueryBalanceResponse$json = const {
  '1': 'QueryBalanceResponse',
  '2': const [
    const {'1': 'balance', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '10': 'balance'},
  ],
};

/// Descriptor for `QueryBalanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBalanceResponseDescriptor = $convert.base64Decode('ChRRdWVyeUJhbGFuY2VSZXNwb25zZRIzCgdiYWxhbmNlGAEgASgLMhkuY29zbW9zLmJhc2UudjFiZXRhMS5Db2luUgdiYWxhbmNl');
@$core.Deprecated('Use queryAllBalancesRequestDescriptor instead')
const QueryAllBalancesRequest$json = const {
  '1': 'QueryAllBalancesRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
  '7': const {},
};

/// Descriptor for `QueryAllBalancesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAllBalancesRequestDescriptor = $convert.base64Decode('ChdRdWVyeUFsbEJhbGFuY2VzUmVxdWVzdBIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNzEkYKCnBhZ2luYXRpb24YAiABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9uOgjooB8AiKAfAA==');
@$core.Deprecated('Use queryAllBalancesResponseDescriptor instead')
const QueryAllBalancesResponse$json = const {
  '1': 'QueryAllBalancesResponse',
  '2': const [
    const {'1': 'balances', '3': 1, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'balances'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryAllBalancesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAllBalancesResponseDescriptor = $convert.base64Decode('ChhRdWVyeUFsbEJhbGFuY2VzUmVzcG9uc2USZwoIYmFsYW5jZXMYASADKAsyGS5jb3Ntb3MuYmFzZS52MWJldGExLkNvaW5CMMjeHwCq3x8oZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5Db2luc1IIYmFsYW5jZXMSRwoKcGFnaW5hdGlvbhgCIAEoCzInLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlc3BvbnNlUgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryTotalSupplyRequestDescriptor instead')
const QueryTotalSupplyRequest$json = const {
  '1': 'QueryTotalSupplyRequest',
  '2': const [
    const {'1': 'pagination', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
  '7': const {},
};

/// Descriptor for `QueryTotalSupplyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTotalSupplyRequestDescriptor = $convert.base64Decode('ChdRdWVyeVRvdGFsU3VwcGx5UmVxdWVzdBJGCgpwYWdpbmF0aW9uGAEgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbjoI6KAfAIigHwA=');
@$core.Deprecated('Use queryTotalSupplyResponseDescriptor instead')
const QueryTotalSupplyResponse$json = const {
  '1': 'QueryTotalSupplyResponse',
  '2': const [
    const {'1': 'supply', '3': 1, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'supply'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryTotalSupplyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTotalSupplyResponseDescriptor = $convert.base64Decode('ChhRdWVyeVRvdGFsU3VwcGx5UmVzcG9uc2USYwoGc3VwcGx5GAEgAygLMhkuY29zbW9zLmJhc2UudjFiZXRhMS5Db2luQjDI3h8Aqt8fKGdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuQ29pbnNSBnN1cHBseRJHCgpwYWdpbmF0aW9uGAIgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
@$core.Deprecated('Use querySupplyOfRequestDescriptor instead')
const QuerySupplyOfRequest$json = const {
  '1': 'QuerySupplyOfRequest',
  '2': const [
    const {'1': 'denom', '3': 1, '4': 1, '5': 9, '10': 'denom'},
  ],
};

/// Descriptor for `QuerySupplyOfRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySupplyOfRequestDescriptor = $convert.base64Decode('ChRRdWVyeVN1cHBseU9mUmVxdWVzdBIUCgVkZW5vbRgBIAEoCVIFZGVub20=');
@$core.Deprecated('Use querySupplyOfResponseDescriptor instead')
const QuerySupplyOfResponse$json = const {
  '1': 'QuerySupplyOfResponse',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'amount'},
  ],
};

/// Descriptor for `QuerySupplyOfResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySupplyOfResponseDescriptor = $convert.base64Decode('ChVRdWVyeVN1cHBseU9mUmVzcG9uc2USNwoGYW1vdW50GAEgASgLMhkuY29zbW9zLmJhc2UudjFiZXRhMS5Db2luQgTI3h8AUgZhbW91bnQ=');
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
    const {'1': 'params', '3': 1, '4': 1, '5': 11, '6': '.cosmos.bank.v1beta1.Params', '8': const {}, '10': 'params'},
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode('ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEjkKBnBhcmFtcxgBIAEoCzIbLmNvc21vcy5iYW5rLnYxYmV0YTEuUGFyYW1zQgTI3h8AUgZwYXJhbXM=');
@$core.Deprecated('Use queryDenomsMetadataRequestDescriptor instead')
const QueryDenomsMetadataRequest$json = const {
  '1': 'QueryDenomsMetadataRequest',
  '2': const [
    const {'1': 'pagination', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryDenomsMetadataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDenomsMetadataRequestDescriptor = $convert.base64Decode('ChpRdWVyeURlbm9tc01ldGFkYXRhUmVxdWVzdBJGCgpwYWdpbmF0aW9uGAEgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryDenomsMetadataResponseDescriptor instead')
const QueryDenomsMetadataResponse$json = const {
  '1': 'QueryDenomsMetadataResponse',
  '2': const [
    const {'1': 'metadatas', '3': 1, '4': 3, '5': 11, '6': '.cosmos.bank.v1beta1.Metadata', '8': const {}, '10': 'metadatas'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryDenomsMetadataResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDenomsMetadataResponseDescriptor = $convert.base64Decode('ChtRdWVyeURlbm9tc01ldGFkYXRhUmVzcG9uc2USQQoJbWV0YWRhdGFzGAEgAygLMh0uY29zbW9zLmJhbmsudjFiZXRhMS5NZXRhZGF0YUIEyN4fAFIJbWV0YWRhdGFzEkcKCnBhZ2luYXRpb24YAiABKAsyJy5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXNwb25zZVIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryDenomMetadataRequestDescriptor instead')
const QueryDenomMetadataRequest$json = const {
  '1': 'QueryDenomMetadataRequest',
  '2': const [
    const {'1': 'denom', '3': 1, '4': 1, '5': 9, '10': 'denom'},
  ],
};

/// Descriptor for `QueryDenomMetadataRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDenomMetadataRequestDescriptor = $convert.base64Decode('ChlRdWVyeURlbm9tTWV0YWRhdGFSZXF1ZXN0EhQKBWRlbm9tGAEgASgJUgVkZW5vbQ==');
@$core.Deprecated('Use queryDenomMetadataResponseDescriptor instead')
const QueryDenomMetadataResponse$json = const {
  '1': 'QueryDenomMetadataResponse',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.cosmos.bank.v1beta1.Metadata', '8': const {}, '10': 'metadata'},
  ],
};

/// Descriptor for `QueryDenomMetadataResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDenomMetadataResponseDescriptor = $convert.base64Decode('ChpRdWVyeURlbm9tTWV0YWRhdGFSZXNwb25zZRI/CghtZXRhZGF0YRgBIAEoCzIdLmNvc21vcy5iYW5rLnYxYmV0YTEuTWV0YWRhdGFCBMjeHwBSCG1ldGFkYXRh');
