///
//  Generated code. Do not modify.
//  source: tendermint/types/types.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use blockIDFlagDescriptor instead')
const BlockIDFlag$json = const {
  '1': 'BlockIDFlag',
  '2': const [
    const {'1': 'BLOCK_ID_FLAG_UNKNOWN', '2': 0, '3': const {}},
    const {'1': 'BLOCK_ID_FLAG_ABSENT', '2': 1, '3': const {}},
    const {'1': 'BLOCK_ID_FLAG_COMMIT', '2': 2, '3': const {}},
    const {'1': 'BLOCK_ID_FLAG_NIL', '2': 3, '3': const {}},
  ],
  '3': const {},
};

/// Descriptor for `BlockIDFlag`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List blockIDFlagDescriptor = $convert.base64Decode('CgtCbG9ja0lERmxhZxIxChVCTE9DS19JRF9GTEFHX1VOS05PV04QABoWip0gEkJsb2NrSURGbGFnVW5rbm93bhIvChRCTE9DS19JRF9GTEFHX0FCU0VOVBABGhWKnSARQmxvY2tJREZsYWdBYnNlbnQSLwoUQkxPQ0tfSURfRkxBR19DT01NSVQQAhoVip0gEUJsb2NrSURGbGFnQ29tbWl0EikKEUJMT0NLX0lEX0ZMQUdfTklMEAMaEoqdIA5CbG9ja0lERmxhZ05pbBoIqKQeAYijHgA=');
@$core.Deprecated('Use signedMsgTypeDescriptor instead')
const SignedMsgType$json = const {
  '1': 'SignedMsgType',
  '2': const [
    const {'1': 'SIGNED_MSG_TYPE_UNKNOWN', '2': 0, '3': const {}},
    const {'1': 'SIGNED_MSG_TYPE_PREVOTE', '2': 1, '3': const {}},
    const {'1': 'SIGNED_MSG_TYPE_PRECOMMIT', '2': 2, '3': const {}},
    const {'1': 'SIGNED_MSG_TYPE_PROPOSAL', '2': 32, '3': const {}},
  ],
  '3': const {},
};

/// Descriptor for `SignedMsgType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List signedMsgTypeDescriptor = $convert.base64Decode('Cg1TaWduZWRNc2dUeXBlEiwKF1NJR05FRF9NU0dfVFlQRV9VTktOT1dOEAAaD4qdIAtVbmtub3duVHlwZRIsChdTSUdORURfTVNHX1RZUEVfUFJFVk9URRABGg+KnSALUHJldm90ZVR5cGUSMAoZU0lHTkVEX01TR19UWVBFX1BSRUNPTU1JVBACGhGKnSANUHJlY29tbWl0VHlwZRIuChhTSUdORURfTVNHX1RZUEVfUFJPUE9TQUwQIBoQip0gDFByb3Bvc2FsVHlwZRoIqKQeAYijHgA=');
@$core.Deprecated('Use partSetHeaderDescriptor instead')
const PartSetHeader$json = const {
  '1': 'PartSetHeader',
  '2': const [
    const {'1': 'total', '3': 1, '4': 1, '5': 13, '10': 'total'},
    const {'1': 'hash', '3': 2, '4': 1, '5': 12, '10': 'hash'},
  ],
};

/// Descriptor for `PartSetHeader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List partSetHeaderDescriptor = $convert.base64Decode('Cg1QYXJ0U2V0SGVhZGVyEhQKBXRvdGFsGAEgASgNUgV0b3RhbBISCgRoYXNoGAIgASgMUgRoYXNo');
@$core.Deprecated('Use partDescriptor instead')
const Part$json = const {
  '1': 'Part',
  '2': const [
    const {'1': 'index', '3': 1, '4': 1, '5': 13, '10': 'index'},
    const {'1': 'bytes', '3': 2, '4': 1, '5': 12, '10': 'bytes'},
    const {'1': 'proof', '3': 3, '4': 1, '5': 11, '6': '.tendermint.crypto.Proof', '8': const {}, '10': 'proof'},
  ],
};

/// Descriptor for `Part`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List partDescriptor = $convert.base64Decode('CgRQYXJ0EhQKBWluZGV4GAEgASgNUgVpbmRleBIUCgVieXRlcxgCIAEoDFIFYnl0ZXMSNAoFcHJvb2YYAyABKAsyGC50ZW5kZXJtaW50LmNyeXB0by5Qcm9vZkIEyN4fAFIFcHJvb2Y=');
@$core.Deprecated('Use blockIDDescriptor instead')
const BlockID$json = const {
  '1': 'BlockID',
  '2': const [
    const {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    const {'1': 'part_set_header', '3': 2, '4': 1, '5': 11, '6': '.tendermint.types.PartSetHeader', '8': const {}, '10': 'partSetHeader'},
  ],
};

/// Descriptor for `BlockID`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockIDDescriptor = $convert.base64Decode('CgdCbG9ja0lEEhIKBGhhc2gYASABKAxSBGhhc2gSTQoPcGFydF9zZXRfaGVhZGVyGAIgASgLMh8udGVuZGVybWludC50eXBlcy5QYXJ0U2V0SGVhZGVyQgTI3h8AUg1wYXJ0U2V0SGVhZGVy');
@$core.Deprecated('Use headerDescriptor instead')
const Header$json = const {
  '1': 'Header',
  '2': const [
    const {'1': 'version', '3': 1, '4': 1, '5': 11, '6': '.tendermint.version.Consensus', '8': const {}, '10': 'version'},
    const {'1': 'chain_id', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'chainId'},
    const {'1': 'height', '3': 3, '4': 1, '5': 3, '10': 'height'},
    const {'1': 'time', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'time'},
    const {'1': 'last_block_id', '3': 5, '4': 1, '5': 11, '6': '.tendermint.types.BlockID', '8': const {}, '10': 'lastBlockId'},
    const {'1': 'last_commit_hash', '3': 6, '4': 1, '5': 12, '10': 'lastCommitHash'},
    const {'1': 'data_hash', '3': 7, '4': 1, '5': 12, '10': 'dataHash'},
    const {'1': 'validators_hash', '3': 8, '4': 1, '5': 12, '10': 'validatorsHash'},
    const {'1': 'next_validators_hash', '3': 9, '4': 1, '5': 12, '10': 'nextValidatorsHash'},
    const {'1': 'consensus_hash', '3': 10, '4': 1, '5': 12, '10': 'consensusHash'},
    const {'1': 'app_hash', '3': 11, '4': 1, '5': 12, '10': 'appHash'},
    const {'1': 'last_results_hash', '3': 12, '4': 1, '5': 12, '10': 'lastResultsHash'},
    const {'1': 'evidence_hash', '3': 13, '4': 1, '5': 12, '10': 'evidenceHash'},
    const {'1': 'proposer_address', '3': 14, '4': 1, '5': 12, '10': 'proposerAddress'},
  ],
};

/// Descriptor for `Header`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List headerDescriptor = $convert.base64Decode('CgZIZWFkZXISPQoHdmVyc2lvbhgBIAEoCzIdLnRlbmRlcm1pbnQudmVyc2lvbi5Db25zZW5zdXNCBMjeHwBSB3ZlcnNpb24SJgoIY2hhaW5faWQYAiABKAlCC+LeHwdDaGFpbklEUgdjaGFpbklkEhYKBmhlaWdodBgDIAEoA1IGaGVpZ2h0EjgKBHRpbWUYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQgjI3h8AkN8fAVIEdGltZRJDCg1sYXN0X2Jsb2NrX2lkGAUgASgLMhkudGVuZGVybWludC50eXBlcy5CbG9ja0lEQgTI3h8AUgtsYXN0QmxvY2tJZBIoChBsYXN0X2NvbW1pdF9oYXNoGAYgASgMUg5sYXN0Q29tbWl0SGFzaBIbCglkYXRhX2hhc2gYByABKAxSCGRhdGFIYXNoEicKD3ZhbGlkYXRvcnNfaGFzaBgIIAEoDFIOdmFsaWRhdG9yc0hhc2gSMAoUbmV4dF92YWxpZGF0b3JzX2hhc2gYCSABKAxSEm5leHRWYWxpZGF0b3JzSGFzaBIlCg5jb25zZW5zdXNfaGFzaBgKIAEoDFINY29uc2Vuc3VzSGFzaBIZCghhcHBfaGFzaBgLIAEoDFIHYXBwSGFzaBIqChFsYXN0X3Jlc3VsdHNfaGFzaBgMIAEoDFIPbGFzdFJlc3VsdHNIYXNoEiMKDWV2aWRlbmNlX2hhc2gYDSABKAxSDGV2aWRlbmNlSGFzaBIpChBwcm9wb3Nlcl9hZGRyZXNzGA4gASgMUg9wcm9wb3NlckFkZHJlc3M=');
@$core.Deprecated('Use dataDescriptor instead')
const Data$json = const {
  '1': 'Data',
  '2': const [
    const {'1': 'txs', '3': 1, '4': 3, '5': 12, '10': 'txs'},
  ],
};

/// Descriptor for `Data`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dataDescriptor = $convert.base64Decode('CgREYXRhEhAKA3R4cxgBIAMoDFIDdHhz');
@$core.Deprecated('Use voteDescriptor instead')
const Vote$json = const {
  '1': 'Vote',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.tendermint.types.SignedMsgType', '10': 'type'},
    const {'1': 'height', '3': 2, '4': 1, '5': 3, '10': 'height'},
    const {'1': 'round', '3': 3, '4': 1, '5': 5, '10': 'round'},
    const {'1': 'block_id', '3': 4, '4': 1, '5': 11, '6': '.tendermint.types.BlockID', '8': const {}, '10': 'blockId'},
    const {'1': 'timestamp', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'timestamp'},
    const {'1': 'validator_address', '3': 6, '4': 1, '5': 12, '10': 'validatorAddress'},
    const {'1': 'validator_index', '3': 7, '4': 1, '5': 5, '10': 'validatorIndex'},
    const {'1': 'signature', '3': 8, '4': 1, '5': 12, '10': 'signature'},
  ],
};

/// Descriptor for `Vote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voteDescriptor = $convert.base64Decode('CgRWb3RlEjMKBHR5cGUYASABKA4yHy50ZW5kZXJtaW50LnR5cGVzLlNpZ25lZE1zZ1R5cGVSBHR5cGUSFgoGaGVpZ2h0GAIgASgDUgZoZWlnaHQSFAoFcm91bmQYAyABKAVSBXJvdW5kEkUKCGJsb2NrX2lkGAQgASgLMhkudGVuZGVybWludC50eXBlcy5CbG9ja0lEQg/I3h8A4t4fB0Jsb2NrSURSB2Jsb2NrSWQSQgoJdGltZXN0YW1wGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIIyN4fAJDfHwFSCXRpbWVzdGFtcBIrChF2YWxpZGF0b3JfYWRkcmVzcxgGIAEoDFIQdmFsaWRhdG9yQWRkcmVzcxInCg92YWxpZGF0b3JfaW5kZXgYByABKAVSDnZhbGlkYXRvckluZGV4EhwKCXNpZ25hdHVyZRgIIAEoDFIJc2lnbmF0dXJl');
@$core.Deprecated('Use commitDescriptor instead')
const Commit$json = const {
  '1': 'Commit',
  '2': const [
    const {'1': 'height', '3': 1, '4': 1, '5': 3, '10': 'height'},
    const {'1': 'round', '3': 2, '4': 1, '5': 5, '10': 'round'},
    const {'1': 'block_id', '3': 3, '4': 1, '5': 11, '6': '.tendermint.types.BlockID', '8': const {}, '10': 'blockId'},
    const {'1': 'signatures', '3': 4, '4': 3, '5': 11, '6': '.tendermint.types.CommitSig', '8': const {}, '10': 'signatures'},
  ],
};

/// Descriptor for `Commit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commitDescriptor = $convert.base64Decode('CgZDb21taXQSFgoGaGVpZ2h0GAEgASgDUgZoZWlnaHQSFAoFcm91bmQYAiABKAVSBXJvdW5kEkUKCGJsb2NrX2lkGAMgASgLMhkudGVuZGVybWludC50eXBlcy5CbG9ja0lEQg/I3h8A4t4fB0Jsb2NrSURSB2Jsb2NrSWQSQQoKc2lnbmF0dXJlcxgEIAMoCzIbLnRlbmRlcm1pbnQudHlwZXMuQ29tbWl0U2lnQgTI3h8AUgpzaWduYXR1cmVz');
@$core.Deprecated('Use commitSigDescriptor instead')
const CommitSig$json = const {
  '1': 'CommitSig',
  '2': const [
    const {'1': 'block_id_flag', '3': 1, '4': 1, '5': 14, '6': '.tendermint.types.BlockIDFlag', '10': 'blockIdFlag'},
    const {'1': 'validator_address', '3': 2, '4': 1, '5': 12, '10': 'validatorAddress'},
    const {'1': 'timestamp', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'timestamp'},
    const {'1': 'signature', '3': 4, '4': 1, '5': 12, '10': 'signature'},
  ],
};

/// Descriptor for `CommitSig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commitSigDescriptor = $convert.base64Decode('CglDb21taXRTaWcSQQoNYmxvY2tfaWRfZmxhZxgBIAEoDjIdLnRlbmRlcm1pbnQudHlwZXMuQmxvY2tJREZsYWdSC2Jsb2NrSWRGbGFnEisKEXZhbGlkYXRvcl9hZGRyZXNzGAIgASgMUhB2YWxpZGF0b3JBZGRyZXNzEkIKCXRpbWVzdGFtcBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBCCMjeHwCQ3x8BUgl0aW1lc3RhbXASHAoJc2lnbmF0dXJlGAQgASgMUglzaWduYXR1cmU=');
@$core.Deprecated('Use proposalDescriptor instead')
const Proposal$json = const {
  '1': 'Proposal',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.tendermint.types.SignedMsgType', '10': 'type'},
    const {'1': 'height', '3': 2, '4': 1, '5': 3, '10': 'height'},
    const {'1': 'round', '3': 3, '4': 1, '5': 5, '10': 'round'},
    const {'1': 'pol_round', '3': 4, '4': 1, '5': 5, '10': 'polRound'},
    const {'1': 'block_id', '3': 5, '4': 1, '5': 11, '6': '.tendermint.types.BlockID', '8': const {}, '10': 'blockId'},
    const {'1': 'timestamp', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'timestamp'},
    const {'1': 'signature', '3': 7, '4': 1, '5': 12, '10': 'signature'},
  ],
};

/// Descriptor for `Proposal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proposalDescriptor = $convert.base64Decode('CghQcm9wb3NhbBIzCgR0eXBlGAEgASgOMh8udGVuZGVybWludC50eXBlcy5TaWduZWRNc2dUeXBlUgR0eXBlEhYKBmhlaWdodBgCIAEoA1IGaGVpZ2h0EhQKBXJvdW5kGAMgASgFUgVyb3VuZBIbCglwb2xfcm91bmQYBCABKAVSCHBvbFJvdW5kEkUKCGJsb2NrX2lkGAUgASgLMhkudGVuZGVybWludC50eXBlcy5CbG9ja0lEQg/i3h8HQmxvY2tJRMjeHwBSB2Jsb2NrSWQSQgoJdGltZXN0YW1wGAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIIyN4fAJDfHwFSCXRpbWVzdGFtcBIcCglzaWduYXR1cmUYByABKAxSCXNpZ25hdHVyZQ==');
@$core.Deprecated('Use signedHeaderDescriptor instead')
const SignedHeader$json = const {
  '1': 'SignedHeader',
  '2': const [
    const {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.tendermint.types.Header', '10': 'header'},
    const {'1': 'commit', '3': 2, '4': 1, '5': 11, '6': '.tendermint.types.Commit', '10': 'commit'},
  ],
};

/// Descriptor for `SignedHeader`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signedHeaderDescriptor = $convert.base64Decode('CgxTaWduZWRIZWFkZXISMAoGaGVhZGVyGAEgASgLMhgudGVuZGVybWludC50eXBlcy5IZWFkZXJSBmhlYWRlchIwCgZjb21taXQYAiABKAsyGC50ZW5kZXJtaW50LnR5cGVzLkNvbW1pdFIGY29tbWl0');
@$core.Deprecated('Use lightBlockDescriptor instead')
const LightBlock$json = const {
  '1': 'LightBlock',
  '2': const [
    const {'1': 'signed_header', '3': 1, '4': 1, '5': 11, '6': '.tendermint.types.SignedHeader', '10': 'signedHeader'},
    const {'1': 'validator_set', '3': 2, '4': 1, '5': 11, '6': '.tendermint.types.ValidatorSet', '10': 'validatorSet'},
  ],
};

/// Descriptor for `LightBlock`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lightBlockDescriptor = $convert.base64Decode('CgpMaWdodEJsb2NrEkMKDXNpZ25lZF9oZWFkZXIYASABKAsyHi50ZW5kZXJtaW50LnR5cGVzLlNpZ25lZEhlYWRlclIMc2lnbmVkSGVhZGVyEkMKDXZhbGlkYXRvcl9zZXQYAiABKAsyHi50ZW5kZXJtaW50LnR5cGVzLlZhbGlkYXRvclNldFIMdmFsaWRhdG9yU2V0');
@$core.Deprecated('Use blockMetaDescriptor instead')
const BlockMeta$json = const {
  '1': 'BlockMeta',
  '2': const [
    const {'1': 'block_id', '3': 1, '4': 1, '5': 11, '6': '.tendermint.types.BlockID', '8': const {}, '10': 'blockId'},
    const {'1': 'block_size', '3': 2, '4': 1, '5': 3, '10': 'blockSize'},
    const {'1': 'header', '3': 3, '4': 1, '5': 11, '6': '.tendermint.types.Header', '8': const {}, '10': 'header'},
    const {'1': 'num_txs', '3': 4, '4': 1, '5': 3, '10': 'numTxs'},
  ],
};

/// Descriptor for `BlockMeta`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockMetaDescriptor = $convert.base64Decode('CglCbG9ja01ldGESRQoIYmxvY2tfaWQYASABKAsyGS50ZW5kZXJtaW50LnR5cGVzLkJsb2NrSURCD+LeHwdCbG9ja0lEyN4fAFIHYmxvY2tJZBIdCgpibG9ja19zaXplGAIgASgDUglibG9ja1NpemUSNgoGaGVhZGVyGAMgASgLMhgudGVuZGVybWludC50eXBlcy5IZWFkZXJCBMjeHwBSBmhlYWRlchIXCgdudW1fdHhzGAQgASgDUgZudW1UeHM=');
@$core.Deprecated('Use txProofDescriptor instead')
const TxProof$json = const {
  '1': 'TxProof',
  '2': const [
    const {'1': 'root_hash', '3': 1, '4': 1, '5': 12, '10': 'rootHash'},
    const {'1': 'data', '3': 2, '4': 1, '5': 12, '10': 'data'},
    const {'1': 'proof', '3': 3, '4': 1, '5': 11, '6': '.tendermint.crypto.Proof', '10': 'proof'},
  ],
};

/// Descriptor for `TxProof`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txProofDescriptor = $convert.base64Decode('CgdUeFByb29mEhsKCXJvb3RfaGFzaBgBIAEoDFIIcm9vdEhhc2gSEgoEZGF0YRgCIAEoDFIEZGF0YRIuCgVwcm9vZhgDIAEoCzIYLnRlbmRlcm1pbnQuY3J5cHRvLlByb29mUgVwcm9vZg==');
