///
//  Generated code. Do not modify.
//  source: cosmos/base/query/v1beta1/pagination.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use pageRequestDescriptor instead')
const PageRequest$json = const {
  '1': 'PageRequest',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 12, '10': 'key'},
    const {'1': 'offset', '3': 2, '4': 1, '5': 4, '10': 'offset'},
    const {'1': 'limit', '3': 3, '4': 1, '5': 4, '10': 'limit'},
    const {'1': 'count_total', '3': 4, '4': 1, '5': 8, '10': 'countTotal'},
    const {'1': 'reverse', '3': 5, '4': 1, '5': 8, '10': 'reverse'},
  ],
};

/// Descriptor for `PageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pageRequestDescriptor = $convert.base64Decode('CgtQYWdlUmVxdWVzdBIQCgNrZXkYASABKAxSA2tleRIWCgZvZmZzZXQYAiABKARSBm9mZnNldBIUCgVsaW1pdBgDIAEoBFIFbGltaXQSHwoLY291bnRfdG90YWwYBCABKAhSCmNvdW50VG90YWwSGAoHcmV2ZXJzZRgFIAEoCFIHcmV2ZXJzZQ==');
@$core.Deprecated('Use pageResponseDescriptor instead')
const PageResponse$json = const {
  '1': 'PageResponse',
  '2': const [
    const {'1': 'next_key', '3': 1, '4': 1, '5': 12, '10': 'nextKey'},
    const {'1': 'total', '3': 2, '4': 1, '5': 4, '10': 'total'},
  ],
};

/// Descriptor for `PageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pageResponseDescriptor = $convert.base64Decode('CgxQYWdlUmVzcG9uc2USGQoIbmV4dF9rZXkYASABKAxSB25leHRLZXkSFAoFdG90YWwYAiABKARSBXRvdGFs');
