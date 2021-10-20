///
//  Generated code. Do not modify.
//  source: cosmos/gov/v1beta1/gov.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use voteOptionDescriptor instead')
const VoteOption$json = const {
  '1': 'VoteOption',
  '2': const [
    const {'1': 'VOTE_OPTION_UNSPECIFIED', '2': 0, '3': const {}},
    const {'1': 'VOTE_OPTION_YES', '2': 1, '3': const {}},
    const {'1': 'VOTE_OPTION_ABSTAIN', '2': 2, '3': const {}},
    const {'1': 'VOTE_OPTION_NO', '2': 3, '3': const {}},
    const {'1': 'VOTE_OPTION_NO_WITH_VETO', '2': 4, '3': const {}},
  ],
  '3': const {},
};

/// Descriptor for `VoteOption`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List voteOptionDescriptor = $convert.base64Decode('CgpWb3RlT3B0aW9uEiwKF1ZPVEVfT1BUSU9OX1VOU1BFQ0lGSUVEEAAaD4qdIAtPcHRpb25FbXB0eRIiCg9WT1RFX09QVElPTl9ZRVMQARoNip0gCU9wdGlvblllcxIqChNWT1RFX09QVElPTl9BQlNUQUlOEAIaEYqdIA1PcHRpb25BYnN0YWluEiAKDlZPVEVfT1BUSU9OX05PEAMaDIqdIAhPcHRpb25ObxIyChhWT1RFX09QVElPTl9OT19XSVRIX1ZFVE8QBBoUip0gEE9wdGlvbk5vV2l0aFZldG8aBIijHgA=');
@$core.Deprecated('Use proposalStatusDescriptor instead')
const ProposalStatus$json = const {
  '1': 'ProposalStatus',
  '2': const [
    const {'1': 'PROPOSAL_STATUS_UNSPECIFIED', '2': 0, '3': const {}},
    const {'1': 'PROPOSAL_STATUS_DEPOSIT_PERIOD', '2': 1, '3': const {}},
    const {'1': 'PROPOSAL_STATUS_VOTING_PERIOD', '2': 2, '3': const {}},
    const {'1': 'PROPOSAL_STATUS_PASSED', '2': 3, '3': const {}},
    const {'1': 'PROPOSAL_STATUS_REJECTED', '2': 4, '3': const {}},
    const {'1': 'PROPOSAL_STATUS_FAILED', '2': 5, '3': const {}},
  ],
  '3': const {},
};

/// Descriptor for `ProposalStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List proposalStatusDescriptor = $convert.base64Decode('Cg5Qcm9wb3NhbFN0YXR1cxIuChtQUk9QT1NBTF9TVEFUVVNfVU5TUEVDSUZJRUQQABoNip0gCVN0YXR1c05pbBI7Ch5QUk9QT1NBTF9TVEFUVVNfREVQT1NJVF9QRVJJT0QQARoXip0gE1N0YXR1c0RlcG9zaXRQZXJpb2QSOQodUFJPUE9TQUxfU1RBVFVTX1ZPVElOR19QRVJJT0QQAhoWip0gElN0YXR1c1ZvdGluZ1BlcmlvZBIsChZQUk9QT1NBTF9TVEFUVVNfUEFTU0VEEAMaEIqdIAxTdGF0dXNQYXNzZWQSMAoYUFJPUE9TQUxfU1RBVFVTX1JFSkVDVEVEEAQaEoqdIA5TdGF0dXNSZWplY3RlZBIsChZQUk9QT1NBTF9TVEFUVVNfRkFJTEVEEAUaEIqdIAxTdGF0dXNGYWlsZWQaBIijHgA=');
@$core.Deprecated('Use weightedVoteOptionDescriptor instead')
const WeightedVoteOption$json = const {
  '1': 'WeightedVoteOption',
  '2': const [
    const {'1': 'option', '3': 1, '4': 1, '5': 14, '6': '.cosmos.gov.v1beta1.VoteOption', '10': 'option'},
    const {'1': 'weight', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'weight'},
  ],
};

/// Descriptor for `WeightedVoteOption`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List weightedVoteOptionDescriptor = $convert.base64Decode('ChJXZWlnaHRlZFZvdGVPcHRpb24SNgoGb3B0aW9uGAEgASgOMh4uY29zbW9zLmdvdi52MWJldGExLlZvdGVPcHRpb25SBm9wdGlvbhJXCgZ3ZWlnaHQYAiABKAlCP9reHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkRlY8jeHwDy3h8NeWFtbDoid2VpZ2h0IlIGd2VpZ2h0');
@$core.Deprecated('Use textProposalDescriptor instead')
const TextProposal$json = const {
  '1': 'TextProposal',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
  ],
  '7': const {},
};

/// Descriptor for `TextProposal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textProposalDescriptor = $convert.base64Decode('CgxUZXh0UHJvcG9zYWwSFAoFdGl0bGUYASABKAlSBXRpdGxlEiAKC2Rlc2NyaXB0aW9uGAIgASgJUgtkZXNjcmlwdGlvbjoP0rQtB0NvbnRlbnTooB8B');
@$core.Deprecated('Use depositDescriptor instead')
const Deposit$json = const {
  '1': 'Deposit',
  '2': const [
    const {'1': 'proposal_id', '3': 1, '4': 1, '5': 4, '8': const {}, '10': 'proposalId'},
    const {'1': 'depositor', '3': 2, '4': 1, '5': 9, '10': 'depositor'},
    const {'1': 'amount', '3': 3, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'amount'},
  ],
  '7': const {},
};

/// Descriptor for `Deposit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List depositDescriptor = $convert.base64Decode('CgdEZXBvc2l0EjcKC3Byb3Bvc2FsX2lkGAEgASgEQhby3h8SeWFtbDoicHJvcG9zYWxfaWQiUgpwcm9wb3NhbElkEhwKCWRlcG9zaXRvchgCIAEoCVIJZGVwb3NpdG9yEmMKBmFtb3VudBgDIAMoCzIZLmNvc21vcy5iYXNlLnYxYmV0YTEuQ29pbkIwyN4fAKrfHyhnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkNvaW5zUgZhbW91bnQ6CIigHwDooB8A');
@$core.Deprecated('Use proposalDescriptor instead')
const Proposal$json = const {
  '1': 'Proposal',
  '2': const [
    const {'1': 'proposal_id', '3': 1, '4': 1, '5': 4, '8': const {}, '10': 'proposalId'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Any', '8': const {}, '10': 'content'},
    const {'1': 'status', '3': 3, '4': 1, '5': 14, '6': '.cosmos.gov.v1beta1.ProposalStatus', '8': const {}, '10': 'status'},
    const {'1': 'final_tally_result', '3': 4, '4': 1, '5': 11, '6': '.cosmos.gov.v1beta1.TallyResult', '8': const {}, '10': 'finalTallyResult'},
    const {'1': 'submit_time', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'submitTime'},
    const {'1': 'deposit_end_time', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'depositEndTime'},
    const {'1': 'total_deposit', '3': 7, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'totalDeposit'},
    const {'1': 'voting_start_time', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'votingStartTime'},
    const {'1': 'voting_end_time', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '8': const {}, '10': 'votingEndTime'},
  ],
  '7': const {},
};

/// Descriptor for `Proposal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List proposalDescriptor = $convert.base64Decode('CghQcm9wb3NhbBI0Cgtwcm9wb3NhbF9pZBgBIAEoBEIT6t4fAmlk8t4fCXlhbWw6ImlkIlIKcHJvcG9zYWxJZBI7Cgdjb250ZW50GAIgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueUILyrQtB0NvbnRlbnRSB2NvbnRlbnQSVgoGc3RhdHVzGAMgASgOMiIuY29zbW9zLmdvdi52MWJldGExLlByb3Bvc2FsU3RhdHVzQhry3h8WeWFtbDoicHJvcG9zYWxfc3RhdHVzIlIGc3RhdHVzEnAKEmZpbmFsX3RhbGx5X3Jlc3VsdBgEIAEoCzIfLmNvc21vcy5nb3YudjFiZXRhMS5UYWxseVJlc3VsdEIhyN4fAPLeHxl5YW1sOiJmaW5hbF90YWxseV9yZXN1bHQiUhBmaW5hbFRhbGx5UmVzdWx0ElsKC3N1Ym1pdF90aW1lGAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIekN8fAcjeHwDy3h8SeWFtbDoic3VibWl0X3RpbWUiUgpzdWJtaXRUaW1lEmkKEGRlcG9zaXRfZW5kX3RpbWUYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQiOQ3x8ByN4fAPLeHxd5YW1sOiJkZXBvc2l0X2VuZF90aW1lIlIOZGVwb3NpdEVuZFRpbWUSiAEKDXRvdGFsX2RlcG9zaXQYByADKAsyGS5jb3Ntb3MuYmFzZS52MWJldGExLkNvaW5CSMjeHwCq3x8oZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5Db2luc/LeHxR5YW1sOiJ0b3RhbF9kZXBvc2l0IlIMdG90YWxEZXBvc2l0EmwKEXZvdGluZ19zdGFydF90aW1lGAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIkkN8fAcjeHwDy3h8YeWFtbDoidm90aW5nX3N0YXJ0X3RpbWUiUg92b3RpbmdTdGFydFRpbWUSZgoPdm90aW5nX2VuZF90aW1lGAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEIikN8fAcjeHwDy3h8WeWFtbDoidm90aW5nX2VuZF90aW1lIlINdm90aW5nRW5kVGltZToE6KAfAQ==');
@$core.Deprecated('Use tallyResultDescriptor instead')
const TallyResult$json = const {
  '1': 'TallyResult',
  '2': const [
    const {'1': 'yes', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'yes'},
    const {'1': 'abstain', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'abstain'},
    const {'1': 'no', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'no'},
    const {'1': 'no_with_veto', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'noWithVeto'},
  ],
  '7': const {},
};

/// Descriptor for `TallyResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tallyResultDescriptor = $convert.base64Decode('CgtUYWxseVJlc3VsdBJACgN5ZXMYASABKAlCLtreHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkludMjeHwBSA3llcxJICgdhYnN0YWluGAIgASgJQi7a3h8mZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5JbnTI3h8AUgdhYnN0YWluEj4KAm5vGAMgASgJQi7a3h8mZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5JbnTI3h8AUgJubxJnCgxub193aXRoX3ZldG8YBCABKAlCRdreHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkludMjeHwDy3h8TeWFtbDoibm9fd2l0aF92ZXRvIlIKbm9XaXRoVmV0bzoE6KAfAQ==');
@$core.Deprecated('Use voteDescriptor instead')
const Vote$json = const {
  '1': 'Vote',
  '2': const [
    const {'1': 'proposal_id', '3': 1, '4': 1, '5': 4, '8': const {}, '10': 'proposalId'},
    const {'1': 'voter', '3': 2, '4': 1, '5': 9, '10': 'voter'},
    const {
      '1': 'option',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.cosmos.gov.v1beta1.VoteOption',
      '8': const {'3': true},
      '10': 'option',
    },
    const {'1': 'options', '3': 4, '4': 3, '5': 11, '6': '.cosmos.gov.v1beta1.WeightedVoteOption', '8': const {}, '10': 'options'},
  ],
  '7': const {},
};

/// Descriptor for `Vote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voteDescriptor = $convert.base64Decode('CgRWb3RlEjcKC3Byb3Bvc2FsX2lkGAEgASgEQhby3h8SeWFtbDoicHJvcG9zYWxfaWQiUgpwcm9wb3NhbElkEhQKBXZvdGVyGAIgASgJUgV2b3RlchI6CgZvcHRpb24YAyABKA4yHi5jb3Ntb3MuZ292LnYxYmV0YTEuVm90ZU9wdGlvbkICGAFSBm9wdGlvbhJGCgdvcHRpb25zGAQgAygLMiYuY29zbW9zLmdvdi52MWJldGExLldlaWdodGVkVm90ZU9wdGlvbkIEyN4fAFIHb3B0aW9uczoImKAfAOigHwA=');
@$core.Deprecated('Use depositParamsDescriptor instead')
const DepositParams$json = const {
  '1': 'DepositParams',
  '2': const [
    const {'1': 'min_deposit', '3': 1, '4': 3, '5': 11, '6': '.cosmos.base.v1beta1.Coin', '8': const {}, '10': 'minDeposit'},
    const {'1': 'max_deposit_period', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '8': const {}, '10': 'maxDepositPeriod'},
  ],
};

/// Descriptor for `DepositParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List depositParamsDescriptor = $convert.base64Decode('Cg1EZXBvc2l0UGFyYW1zEpsBCgttaW5fZGVwb3NpdBgBIAMoCzIZLmNvc21vcy5iYXNlLnYxYmV0YTEuQ29pbkJfyN4fAKrfHyhnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkNvaW5z8t4fEnlhbWw6Im1pbl9kZXBvc2l0IureHxVtaW5fZGVwb3NpdCxvbWl0ZW1wdHlSCm1pbkRlcG9zaXQSjgEKEm1heF9kZXBvc2l0X3BlcmlvZBgCIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvbkJFyN4fAJjfHwHq3h8cbWF4X2RlcG9zaXRfcGVyaW9kLG9taXRlbXB0efLeHxl5YW1sOiJtYXhfZGVwb3NpdF9wZXJpb2QiUhBtYXhEZXBvc2l0UGVyaW9k');
@$core.Deprecated('Use votingParamsDescriptor instead')
const VotingParams$json = const {
  '1': 'VotingParams',
  '2': const [
    const {'1': 'voting_period', '3': 1, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '8': const {}, '10': 'votingPeriod'},
  ],
};

/// Descriptor for `VotingParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List votingParamsDescriptor = $convert.base64Decode('CgxWb3RpbmdQYXJhbXMSewoNdm90aW5nX3BlcmlvZBgBIAEoCzIZLmdvb2dsZS5wcm90b2J1Zi5EdXJhdGlvbkI7yN4fAJjfHwHq3h8Xdm90aW5nX3BlcmlvZCxvbWl0ZW1wdHny3h8UeWFtbDoidm90aW5nX3BlcmlvZCJSDHZvdGluZ1BlcmlvZA==');
@$core.Deprecated('Use tallyParamsDescriptor instead')
const TallyParams$json = const {
  '1': 'TallyParams',
  '2': const [
    const {'1': 'quorum', '3': 1, '4': 1, '5': 12, '8': const {}, '10': 'quorum'},
    const {'1': 'threshold', '3': 2, '4': 1, '5': 12, '8': const {}, '10': 'threshold'},
    const {'1': 'veto_threshold', '3': 3, '4': 1, '5': 12, '8': const {}, '10': 'vetoThreshold'},
  ],
};

/// Descriptor for `TallyParams`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tallyParamsDescriptor = $convert.base64Decode('CgtUYWxseVBhcmFtcxJaCgZxdW9ydW0YASABKAxCQtreHyZnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkRlY8jeHwDq3h8QcXVvcnVtLG9taXRlbXB0eVIGcXVvcnVtEmMKCXRocmVzaG9sZBgCIAEoDEJF2t4fJmdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuRGVjyN4fAOreHxN0aHJlc2hvbGQsb21pdGVtcHR5Ugl0aHJlc2hvbGQSigEKDnZldG9fdGhyZXNob2xkGAMgASgMQmPa3h8mZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5EZWPI3h8A6t4fGHZldG9fdGhyZXNob2xkLG9taXRlbXB0efLeHxV5YW1sOiJ2ZXRvX3RocmVzaG9sZCJSDXZldG9UaHJlc2hvbGQ=');
