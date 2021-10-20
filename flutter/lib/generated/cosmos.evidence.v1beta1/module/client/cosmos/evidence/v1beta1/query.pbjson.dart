///
//  Generated code. Do not modify.
//  source: cosmos/evidence/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use queryEvidenceRequestDescriptor instead')
const QueryEvidenceRequest$json = const {
  '1': 'QueryEvidenceRequest',
  '2': const [
    const {'1': 'evidence_hash', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'evidenceHash'},
  ],
};

/// Descriptor for `QueryEvidenceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryEvidenceRequestDescriptor = $convert.base64Decode('ChRRdWVyeUV2aWRlbmNlUmVxdWVzdBJdCg1ldmlkZW5jZV9oYXNoGAEgASgMQjj63h80Z2l0aHViLmNvbS90ZW5kZXJtaW50L3RlbmRlcm1pbnQvbGlicy9ieXRlcy5IZXhCeXRlc1IMZXZpZGVuY2VIYXNo');
@$core.Deprecated('Use queryEvidenceResponseDescriptor instead')
const QueryEvidenceResponse$json = const {
  '1': 'QueryEvidenceResponse',
  '2': const [
    const {'1': 'evidence', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'evidence'},
  ],
};

/// Descriptor for `QueryEvidenceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryEvidenceResponseDescriptor = $convert.base64Decode('ChVRdWVyeUV2aWRlbmNlUmVzcG9uc2USMAoIZXZpZGVuY2UYASABKAsyFC5nb29nbGUucHJvdG9idWYuQW55UghldmlkZW5jZQ==');
@$core.Deprecated('Use queryAllEvidenceRequestDescriptor instead')
const QueryAllEvidenceRequest$json = const {
  '1': 'QueryAllEvidenceRequest',
  '2': const [
    const {'1': 'pagination', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryAllEvidenceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAllEvidenceRequestDescriptor = $convert.base64Decode('ChdRdWVyeUFsbEV2aWRlbmNlUmVxdWVzdBJGCgpwYWdpbmF0aW9uGAEgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryAllEvidenceResponseDescriptor instead')
const QueryAllEvidenceResponse$json = const {
  '1': 'QueryAllEvidenceResponse',
  '2': const [
    const {'1': 'evidence', '3': 1, '4': 3, '5': 11, '6': '.google.protobuf.Any', '10': 'evidence'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryAllEvidenceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAllEvidenceResponseDescriptor = $convert.base64Decode('ChhRdWVyeUFsbEV2aWRlbmNlUmVzcG9uc2USMAoIZXZpZGVuY2UYASADKAsyFC5nb29nbGUucHJvdG9idWYuQW55UghldmlkZW5jZRJHCgpwYWdpbmF0aW9uGAIgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
