///
//  Generated code. Do not modify.
//  source: tendermint/crypto/keys.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use publicKeyDescriptor instead')
const PublicKey$json = const {
  '1': 'PublicKey',
  '2': const [
    const {'1': 'ed25519', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'ed25519'},
    const {'1': 'secp256k1', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'secp256k1'},
  ],
  '7': const {},
  '8': const [
    const {'1': 'sum'},
  ],
};

/// Descriptor for `PublicKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publicKeyDescriptor = $convert.base64Decode('CglQdWJsaWNLZXkSGgoHZWQyNTUxORgBIAEoDEgAUgdlZDI1NTE5Eh4KCXNlY3AyNTZrMRgCIAEoDEgAUglzZWNwMjU2azE6COihHwHooB8BQgUKA3N1bQ==');
