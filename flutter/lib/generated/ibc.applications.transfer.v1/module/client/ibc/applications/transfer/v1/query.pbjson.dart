///
//  Generated code. Do not modify.
//  source: ibc/applications/transfer/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use queryDenomTraceRequestDescriptor instead')
const QueryDenomTraceRequest$json = const {
  '1': 'QueryDenomTraceRequest',
  '2': const [
    const {'1': 'hash', '3': 1, '4': 1, '5': 9, '10': 'hash'},
  ],
};

/// Descriptor for `QueryDenomTraceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDenomTraceRequestDescriptor = $convert.base64Decode('ChZRdWVyeURlbm9tVHJhY2VSZXF1ZXN0EhIKBGhhc2gYASABKAlSBGhhc2g=');
@$core.Deprecated('Use queryDenomTraceResponseDescriptor instead')
const QueryDenomTraceResponse$json = const {
  '1': 'QueryDenomTraceResponse',
  '2': const [
    const {'1': 'denom_trace', '3': 1, '4': 1, '5': 11, '6': '.ibc.applications.transfer.v1.DenomTrace', '10': 'denomTrace'},
  ],
};

/// Descriptor for `QueryDenomTraceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDenomTraceResponseDescriptor = $convert.base64Decode('ChdRdWVyeURlbm9tVHJhY2VSZXNwb25zZRJJCgtkZW5vbV90cmFjZRgBIAEoCzIoLmliYy5hcHBsaWNhdGlvbnMudHJhbnNmZXIudjEuRGVub21UcmFjZVIKZGVub21UcmFjZQ==');
@$core.Deprecated('Use queryDenomTracesRequestDescriptor instead')
const QueryDenomTracesRequest$json = const {
  '1': 'QueryDenomTracesRequest',
  '2': const [
    const {'1': 'pagination', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryDenomTracesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDenomTracesRequestDescriptor = $convert.base64Decode('ChdRdWVyeURlbm9tVHJhY2VzUmVxdWVzdBJGCgpwYWdpbmF0aW9uGAEgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryDenomTracesResponseDescriptor instead')
const QueryDenomTracesResponse$json = const {
  '1': 'QueryDenomTracesResponse',
  '2': const [
    const {'1': 'denom_traces', '3': 1, '4': 3, '5': 11, '6': '.ibc.applications.transfer.v1.DenomTrace', '8': const {}, '10': 'denomTraces'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryDenomTracesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDenomTracesResponseDescriptor = $convert.base64Decode('ChhRdWVyeURlbm9tVHJhY2VzUmVzcG9uc2USWwoMZGVub21fdHJhY2VzGAEgAygLMiguaWJjLmFwcGxpY2F0aW9ucy50cmFuc2Zlci52MS5EZW5vbVRyYWNlQg6q3x8GVHJhY2VzyN4fAFILZGVub21UcmFjZXMSRwoKcGFnaW5hdGlvbhgCIAEoCzInLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlc3BvbnNlUgpwYWdpbmF0aW9u');
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
    const {'1': 'params', '3': 1, '4': 1, '5': 11, '6': '.ibc.applications.transfer.v1.Params', '10': 'params'},
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode('ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEjwKBnBhcmFtcxgBIAEoCzIkLmliYy5hcHBsaWNhdGlvbnMudHJhbnNmZXIudjEuUGFyYW1zUgZwYXJhbXM=');
