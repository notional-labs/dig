///
//  Generated code. Do not modify.
//  source: tendermint/crypto/proof.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use proofDescriptor instead')
const Proof$json = const {
  '1': 'Proof',
  '2': const [
    const {'1': 'total', '3': 1, '4': 1, '5': 3, '10': 'total'},
    const {'1': 'index', '3': 2, '4': 1, '5': 3, '10': 'index'},
    const {'1': 'leaf_hash', '3': 3, '4': 1, '5': 12, '10': 'leafHash'},
    const {'1': 'aunts', '3': 4, '4': 3, '5': 12, '10': 'aunts'},
  ],
};

/// Descriptor for `Proof`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proofDescriptor = $convert.base64Decode('CgVQcm9vZhIUCgV0b3RhbBgBIAEoA1IFdG90YWwSFAoFaW5kZXgYAiABKANSBWluZGV4EhsKCWxlYWZfaGFzaBgDIAEoDFIIbGVhZkhhc2gSFAoFYXVudHMYBCADKAxSBWF1bnRz');
@$core.Deprecated('Use valueOpDescriptor instead')
const ValueOp$json = const {
  '1': 'ValueOp',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 12, '10': 'key'},
    const {'1': 'proof', '3': 2, '4': 1, '5': 11, '6': '.tendermint.crypto.Proof', '10': 'proof'},
  ],
};

/// Descriptor for `ValueOp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List valueOpDescriptor = $convert.base64Decode('CgdWYWx1ZU9wEhAKA2tleRgBIAEoDFIDa2V5Ei4KBXByb29mGAIgASgLMhgudGVuZGVybWludC5jcnlwdG8uUHJvb2ZSBXByb29m');
@$core.Deprecated('Use dominoOpDescriptor instead')
const DominoOp$json = const {
  '1': 'DominoOp',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'input', '3': 2, '4': 1, '5': 9, '10': 'input'},
    const {'1': 'output', '3': 3, '4': 1, '5': 9, '10': 'output'},
  ],
};

/// Descriptor for `DominoOp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dominoOpDescriptor = $convert.base64Decode('CghEb21pbm9PcBIQCgNrZXkYASABKAlSA2tleRIUCgVpbnB1dBgCIAEoCVIFaW5wdXQSFgoGb3V0cHV0GAMgASgJUgZvdXRwdXQ=');
@$core.Deprecated('Use proofOpDescriptor instead')
const ProofOp$json = const {
  '1': 'ProofOp',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'key', '3': 2, '4': 1, '5': 12, '10': 'key'},
    const {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `ProofOp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proofOpDescriptor = $convert.base64Decode('CgdQcm9vZk9wEhIKBHR5cGUYASABKAlSBHR5cGUSEAoDa2V5GAIgASgMUgNrZXkSEgoEZGF0YRgDIAEoDFIEZGF0YQ==');
@$core.Deprecated('Use proofOpsDescriptor instead')
const ProofOps$json = const {
  '1': 'ProofOps',
  '2': const [
    const {'1': 'ops', '3': 1, '4': 3, '5': 11, '6': '.tendermint.crypto.ProofOp', '8': const {}, '10': 'ops'},
  ],
};

/// Descriptor for `ProofOps`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proofOpsDescriptor = $convert.base64Decode('CghQcm9vZk9wcxIyCgNvcHMYASADKAsyGi50ZW5kZXJtaW50LmNyeXB0by5Qcm9vZk9wQgTI3h8AUgNvcHM=');
