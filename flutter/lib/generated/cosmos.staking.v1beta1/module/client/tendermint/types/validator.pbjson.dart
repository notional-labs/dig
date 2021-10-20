///
//  Generated code. Do not modify.
//  source: tendermint/types/validator.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use validatorSetDescriptor instead')
const ValidatorSet$json = const {
  '1': 'ValidatorSet',
  '2': const [
    const {'1': 'validators', '3': 1, '4': 3, '5': 11, '6': '.tendermint.types.Validator', '10': 'validators'},
    const {'1': 'proposer', '3': 2, '4': 1, '5': 11, '6': '.tendermint.types.Validator', '10': 'proposer'},
    const {'1': 'total_voting_power', '3': 3, '4': 1, '5': 3, '10': 'totalVotingPower'},
  ],
};

/// Descriptor for `ValidatorSet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorSetDescriptor = $convert.base64Decode('CgxWYWxpZGF0b3JTZXQSOwoKdmFsaWRhdG9ycxgBIAMoCzIbLnRlbmRlcm1pbnQudHlwZXMuVmFsaWRhdG9yUgp2YWxpZGF0b3JzEjcKCHByb3Bvc2VyGAIgASgLMhsudGVuZGVybWludC50eXBlcy5WYWxpZGF0b3JSCHByb3Bvc2VyEiwKEnRvdGFsX3ZvdGluZ19wb3dlchgDIAEoA1IQdG90YWxWb3RpbmdQb3dlcg==');
@$core.Deprecated('Use validatorDescriptor instead')
const Validator$json = const {
  '1': 'Validator',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 12, '10': 'address'},
    const {'1': 'pub_key', '3': 2, '4': 1, '5': 11, '6': '.tendermint.crypto.PublicKey', '8': const {}, '10': 'pubKey'},
    const {'1': 'voting_power', '3': 3, '4': 1, '5': 3, '10': 'votingPower'},
    const {'1': 'proposer_priority', '3': 4, '4': 1, '5': 3, '10': 'proposerPriority'},
  ],
};

/// Descriptor for `Validator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorDescriptor = $convert.base64Decode('CglWYWxpZGF0b3ISGAoHYWRkcmVzcxgBIAEoDFIHYWRkcmVzcxI7CgdwdWJfa2V5GAIgASgLMhwudGVuZGVybWludC5jcnlwdG8uUHVibGljS2V5QgTI3h8AUgZwdWJLZXkSIQoMdm90aW5nX3Bvd2VyGAMgASgDUgt2b3RpbmdQb3dlchIrChFwcm9wb3Nlcl9wcmlvcml0eRgEIAEoA1IQcHJvcG9zZXJQcmlvcml0eQ==');
@$core.Deprecated('Use simpleValidatorDescriptor instead')
const SimpleValidator$json = const {
  '1': 'SimpleValidator',
  '2': const [
    const {'1': 'pub_key', '3': 1, '4': 1, '5': 11, '6': '.tendermint.crypto.PublicKey', '10': 'pubKey'},
    const {'1': 'voting_power', '3': 2, '4': 1, '5': 3, '10': 'votingPower'},
  ],
};

/// Descriptor for `SimpleValidator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List simpleValidatorDescriptor = $convert.base64Decode('Cg9TaW1wbGVWYWxpZGF0b3ISNQoHcHViX2tleRgBIAEoCzIcLnRlbmRlcm1pbnQuY3J5cHRvLlB1YmxpY0tleVIGcHViS2V5EiEKDHZvdGluZ19wb3dlchgCIAEoA1ILdm90aW5nUG93ZXI=');
