///
//  Generated code. Do not modify.
//  source: google/api/http.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use httpDescriptor instead')
const Http$json = const {
  '1': 'Http',
  '2': const [
    const {'1': 'rules', '3': 1, '4': 3, '5': 11, '6': '.google.api.HttpRule', '10': 'rules'},
    const {'1': 'fully_decode_reserved_expansion', '3': 2, '4': 1, '5': 8, '10': 'fullyDecodeReservedExpansion'},
  ],
};

/// Descriptor for `Http`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List httpDescriptor = $convert.base64Decode('CgRIdHRwEioKBXJ1bGVzGAEgAygLMhQuZ29vZ2xlLmFwaS5IdHRwUnVsZVIFcnVsZXMSRQofZnVsbHlfZGVjb2RlX3Jlc2VydmVkX2V4cGFuc2lvbhgCIAEoCFIcZnVsbHlEZWNvZGVSZXNlcnZlZEV4cGFuc2lvbg==');
@$core.Deprecated('Use httpRuleDescriptor instead')
const HttpRule$json = const {
  '1': 'HttpRule',
  '2': const [
    const {'1': 'selector', '3': 1, '4': 1, '5': 9, '10': 'selector'},
    const {'1': 'get', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'get'},
    const {'1': 'put', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'put'},
    const {'1': 'post', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'post'},
    const {'1': 'delete', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'delete'},
    const {'1': 'patch', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'patch'},
    const {'1': 'custom', '3': 8, '4': 1, '5': 11, '6': '.google.api.CustomHttpPattern', '9': 0, '10': 'custom'},
    const {'1': 'body', '3': 7, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'response_body', '3': 12, '4': 1, '5': 9, '10': 'responseBody'},
    const {'1': 'additional_bindings', '3': 11, '4': 3, '5': 11, '6': '.google.api.HttpRule', '10': 'additionalBindings'},
  ],
  '8': const [
    const {'1': 'pattern'},
  ],
};

/// Descriptor for `HttpRule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List httpRuleDescriptor = $convert.base64Decode('CghIdHRwUnVsZRIaCghzZWxlY3RvchgBIAEoCVIIc2VsZWN0b3ISEgoDZ2V0GAIgASgJSABSA2dldBISCgNwdXQYAyABKAlIAFIDcHV0EhQKBHBvc3QYBCABKAlIAFIEcG9zdBIYCgZkZWxldGUYBSABKAlIAFIGZGVsZXRlEhYKBXBhdGNoGAYgASgJSABSBXBhdGNoEjcKBmN1c3RvbRgIIAEoCzIdLmdvb2dsZS5hcGkuQ3VzdG9tSHR0cFBhdHRlcm5IAFIGY3VzdG9tEhIKBGJvZHkYByABKAlSBGJvZHkSIwoNcmVzcG9uc2VfYm9keRgMIAEoCVIMcmVzcG9uc2VCb2R5EkUKE2FkZGl0aW9uYWxfYmluZGluZ3MYCyADKAsyFC5nb29nbGUuYXBpLkh0dHBSdWxlUhJhZGRpdGlvbmFsQmluZGluZ3NCCQoHcGF0dGVybg==');
@$core.Deprecated('Use customHttpPatternDescriptor instead')
const CustomHttpPattern$json = const {
  '1': 'CustomHttpPattern',
  '2': const [
    const {'1': 'kind', '3': 1, '4': 1, '5': 9, '10': 'kind'},
    const {'1': 'path', '3': 2, '4': 1, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `CustomHttpPattern`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List customHttpPatternDescriptor = $convert.base64Decode('ChFDdXN0b21IdHRwUGF0dGVybhISCgRraW5kGAEgASgJUgRraW5kEhIKBHBhdGgYAiABKAlSBHBhdGg=');
