///
//  Generated code. Do not modify.
//  source: cosmos/auth/v1beta1/auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use baseAccountDescriptor instead')
const BaseAccount$json = const {
  '1': 'BaseAccount',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'pub_key', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Any', '8': const {}, '10': 'pubKey'},
    const {'1': 'account_number', '3': 3, '4': 1, '5': 4, '8': const {}, '10': 'accountNumber'},
    const {'1': 'sequence', '3': 4, '4': 1, '5': 4, '10': 'sequence'},
  ],
  '7': const {},
};

/// Descriptor for `BaseAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List baseAccountDescriptor = $convert.base64Decode('CgtCYXNlQWNjb3VudBIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNzElwKB3B1Yl9rZXkYAiABKAsyFC5nb29nbGUucHJvdG9idWYuQW55Qi3q3h8UcHVibGljX2tleSxvbWl0ZW1wdHny3h8ReWFtbDoicHVibGljX2tleSJSBnB1YktleRJACg5hY2NvdW50X251bWJlchgDIAEoBEIZ8t4fFXlhbWw6ImFjY291bnRfbnVtYmVyIlINYWNjb3VudE51bWJlchIaCghzZXF1ZW5jZRgEIAEoBFIIc2VxdWVuY2U6GIigHwCYoB8A6KAfANK0LQhBY2NvdW50SQ==');
@$core.Deprecated('Use moduleAccountDescriptor instead')
const ModuleAccount$json = const {
  '1': 'ModuleAccount',
  '2': const [
    const {'1': 'base_account', '3': 1, '4': 1, '5': 11, '6': '.cosmos.auth.v1beta1.BaseAccount', '8': const {}, '10': 'baseAccount'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'permissions', '3': 3, '4': 3, '5': 9, '10': 'permissions'},
  ],
  '7': const {},
};

/// Descriptor for `ModuleAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moduleAccountDescriptor = $convert.base64Decode('Cg1Nb2R1bGVBY2NvdW50EmAKDGJhc2VfYWNjb3VudBgBIAEoCzIgLmNvc21vcy5hdXRoLnYxYmV0YTEuQmFzZUFjY291bnRCG9DeHwHy3h8TeWFtbDoiYmFzZV9hY2NvdW50IlILYmFzZUFjY291bnQSEgoEbmFtZRgCIAEoCVIEbmFtZRIgCgtwZXJtaXNzaW9ucxgDIAMoCVILcGVybWlzc2lvbnM6GoigHwCYoB8A0rQtDk1vZHVsZUFjY291bnRJ');
@$core.Deprecated('Use paramsDescriptor instead')
const Params$json = const {
  '1': 'Params',
  '2': const [
    const {'1': 'max_memo_characters', '3': 1, '4': 1, '5': 4, '8': const {}, '10': 'maxMemoCharacters'},
    const {'1': 'tx_sig_limit', '3': 2, '4': 1, '5': 4, '8': const {}, '10': 'txSigLimit'},
    const {'1': 'tx_size_cost_per_byte', '3': 3, '4': 1, '5': 4, '8': const {}, '10': 'txSizeCostPerByte'},
    const {'1': 'sig_verify_cost_ed25519', '3': 4, '4': 1, '5': 4, '8': const {}, '10': 'sigVerifyCostEd25519'},
    const {'1': 'sig_verify_cost_secp256k1', '3': 5, '4': 1, '5': 4, '8': const {}, '10': 'sigVerifyCostSecp256k1'},
  ],
  '7': const {},
};

/// Descriptor for `Params`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paramsDescriptor = $convert.base64Decode('CgZQYXJhbXMSTgoTbWF4X21lbW9fY2hhcmFjdGVycxgBIAEoBEIe8t4fGnlhbWw6Im1heF9tZW1vX2NoYXJhY3RlcnMiUhFtYXhNZW1vQ2hhcmFjdGVycxI5Cgx0eF9zaWdfbGltaXQYAiABKARCF/LeHxN5YW1sOiJ0eF9zaWdfbGltaXQiUgp0eFNpZ0xpbWl0ElIKFXR4X3NpemVfY29zdF9wZXJfYnl0ZRgDIAEoBEIg8t4fHHlhbWw6InR4X3NpemVfY29zdF9wZXJfYnl0ZSJSEXR4U2l6ZUNvc3RQZXJCeXRlEnEKF3NpZ192ZXJpZnlfY29zdF9lZDI1NTE5GAQgASgEQjri3h8UU2lnVmVyaWZ5Q29zdEVEMjU1MTny3h8eeWFtbDoic2lnX3ZlcmlmeV9jb3N0X2VkMjU1MTkiUhRzaWdWZXJpZnlDb3N0RWQyNTUxORJ5ChlzaWdfdmVyaWZ5X2Nvc3Rfc2VjcDI1NmsxGAUgASgEQj7i3h8WU2lnVmVyaWZ5Q29zdFNlY3AyNTZrMfLeHyB5YW1sOiJzaWdfdmVyaWZ5X2Nvc3Rfc2VjcDI1NmsxIlIWc2lnVmVyaWZ5Q29zdFNlY3AyNTZrMToI6KAfAZigHwA=');
