///
//  Generated code. Do not modify.
//  source: cosmos/gov/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use queryProposalRequestDescriptor instead')
const QueryProposalRequest$json = const {
  '1': 'QueryProposalRequest',
  '2': const [
    const {'1': 'proposal_id', '3': 1, '4': 1, '5': 4, '10': 'proposalId'},
  ],
};

/// Descriptor for `QueryProposalRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryProposalRequestDescriptor = $convert.base64Decode('ChRRdWVyeVByb3Bvc2FsUmVxdWVzdBIfCgtwcm9wb3NhbF9pZBgBIAEoBFIKcHJvcG9zYWxJZA==');
@$core.Deprecated('Use queryProposalResponseDescriptor instead')
const QueryProposalResponse$json = const {
  '1': 'QueryProposalResponse',
  '2': const [
    const {'1': 'proposal', '3': 1, '4': 1, '5': 11, '6': '.cosmos.gov.v1beta1.Proposal', '8': const {}, '10': 'proposal'},
  ],
};

/// Descriptor for `QueryProposalResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryProposalResponseDescriptor = $convert.base64Decode('ChVRdWVyeVByb3Bvc2FsUmVzcG9uc2USPgoIcHJvcG9zYWwYASABKAsyHC5jb3Ntb3MuZ292LnYxYmV0YTEuUHJvcG9zYWxCBMjeHwBSCHByb3Bvc2Fs');
@$core.Deprecated('Use queryProposalsRequestDescriptor instead')
const QueryProposalsRequest$json = const {
  '1': 'QueryProposalsRequest',
  '2': const [
    const {'1': 'proposal_status', '3': 1, '4': 1, '5': 14, '6': '.cosmos.gov.v1beta1.ProposalStatus', '10': 'proposalStatus'},
    const {'1': 'voter', '3': 2, '4': 1, '5': 9, '10': 'voter'},
    const {'1': 'depositor', '3': 3, '4': 1, '5': 9, '10': 'depositor'},
    const {'1': 'pagination', '3': 4, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
  '7': const {},
};

/// Descriptor for `QueryProposalsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryProposalsRequestDescriptor = $convert.base64Decode('ChVRdWVyeVByb3Bvc2Fsc1JlcXVlc3QSSwoPcHJvcG9zYWxfc3RhdHVzGAEgASgOMiIuY29zbW9zLmdvdi52MWJldGExLlByb3Bvc2FsU3RhdHVzUg5wcm9wb3NhbFN0YXR1cxIUCgV2b3RlchgCIAEoCVIFdm90ZXISHAoJZGVwb3NpdG9yGAMgASgJUglkZXBvc2l0b3ISRgoKcGFnaW5hdGlvbhgEIAEoCzImLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlcXVlc3RSCnBhZ2luYXRpb246COigHwCIoB8A');
@$core.Deprecated('Use queryProposalsResponseDescriptor instead')
const QueryProposalsResponse$json = const {
  '1': 'QueryProposalsResponse',
  '2': const [
    const {'1': 'proposals', '3': 1, '4': 3, '5': 11, '6': '.cosmos.gov.v1beta1.Proposal', '8': const {}, '10': 'proposals'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryProposalsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryProposalsResponseDescriptor = $convert.base64Decode('ChZRdWVyeVByb3Bvc2Fsc1Jlc3BvbnNlEkAKCXByb3Bvc2FscxgBIAMoCzIcLmNvc21vcy5nb3YudjFiZXRhMS5Qcm9wb3NhbEIEyN4fAFIJcHJvcG9zYWxzEkcKCnBhZ2luYXRpb24YAiABKAsyJy5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXNwb25zZVIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryVoteRequestDescriptor instead')
const QueryVoteRequest$json = const {
  '1': 'QueryVoteRequest',
  '2': const [
    const {'1': 'proposal_id', '3': 1, '4': 1, '5': 4, '10': 'proposalId'},
    const {'1': 'voter', '3': 2, '4': 1, '5': 9, '10': 'voter'},
  ],
  '7': const {},
};

/// Descriptor for `QueryVoteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryVoteRequestDescriptor = $convert.base64Decode('ChBRdWVyeVZvdGVSZXF1ZXN0Eh8KC3Byb3Bvc2FsX2lkGAEgASgEUgpwcm9wb3NhbElkEhQKBXZvdGVyGAIgASgJUgV2b3RlcjoI6KAfAIigHwA=');
@$core.Deprecated('Use queryVoteResponseDescriptor instead')
const QueryVoteResponse$json = const {
  '1': 'QueryVoteResponse',
  '2': const [
    const {'1': 'vote', '3': 1, '4': 1, '5': 11, '6': '.cosmos.gov.v1beta1.Vote', '8': const {}, '10': 'vote'},
  ],
};

/// Descriptor for `QueryVoteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryVoteResponseDescriptor = $convert.base64Decode('ChFRdWVyeVZvdGVSZXNwb25zZRIyCgR2b3RlGAEgASgLMhguY29zbW9zLmdvdi52MWJldGExLlZvdGVCBMjeHwBSBHZvdGU=');
@$core.Deprecated('Use queryVotesRequestDescriptor instead')
const QueryVotesRequest$json = const {
  '1': 'QueryVotesRequest',
  '2': const [
    const {'1': 'proposal_id', '3': 1, '4': 1, '5': 4, '10': 'proposalId'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryVotesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryVotesRequestDescriptor = $convert.base64Decode('ChFRdWVyeVZvdGVzUmVxdWVzdBIfCgtwcm9wb3NhbF9pZBgBIAEoBFIKcHJvcG9zYWxJZBJGCgpwYWdpbmF0aW9uGAIgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryVotesResponseDescriptor instead')
const QueryVotesResponse$json = const {
  '1': 'QueryVotesResponse',
  '2': const [
    const {'1': 'votes', '3': 1, '4': 3, '5': 11, '6': '.cosmos.gov.v1beta1.Vote', '8': const {}, '10': 'votes'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryVotesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryVotesResponseDescriptor = $convert.base64Decode('ChJRdWVyeVZvdGVzUmVzcG9uc2USNAoFdm90ZXMYASADKAsyGC5jb3Ntb3MuZ292LnYxYmV0YTEuVm90ZUIEyN4fAFIFdm90ZXMSRwoKcGFnaW5hdGlvbhgCIAEoCzInLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlc3BvbnNlUgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryParamsRequestDescriptor instead')
const QueryParamsRequest$json = const {
  '1': 'QueryParamsRequest',
  '2': const [
    const {'1': 'params_type', '3': 1, '4': 1, '5': 9, '10': 'paramsType'},
  ],
};

/// Descriptor for `QueryParamsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsRequestDescriptor = $convert.base64Decode('ChJRdWVyeVBhcmFtc1JlcXVlc3QSHwoLcGFyYW1zX3R5cGUYASABKAlSCnBhcmFtc1R5cGU=');
@$core.Deprecated('Use queryParamsResponseDescriptor instead')
const QueryParamsResponse$json = const {
  '1': 'QueryParamsResponse',
  '2': const [
    const {'1': 'voting_params', '3': 1, '4': 1, '5': 11, '6': '.cosmos.gov.v1beta1.VotingParams', '8': const {}, '10': 'votingParams'},
    const {'1': 'deposit_params', '3': 2, '4': 1, '5': 11, '6': '.cosmos.gov.v1beta1.DepositParams', '8': const {}, '10': 'depositParams'},
    const {'1': 'tally_params', '3': 3, '4': 1, '5': 11, '6': '.cosmos.gov.v1beta1.TallyParams', '8': const {}, '10': 'tallyParams'},
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode('ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEksKDXZvdGluZ19wYXJhbXMYASABKAsyIC5jb3Ntb3MuZ292LnYxYmV0YTEuVm90aW5nUGFyYW1zQgTI3h8AUgx2b3RpbmdQYXJhbXMSTgoOZGVwb3NpdF9wYXJhbXMYAiABKAsyIS5jb3Ntb3MuZ292LnYxYmV0YTEuRGVwb3NpdFBhcmFtc0IEyN4fAFINZGVwb3NpdFBhcmFtcxJICgx0YWxseV9wYXJhbXMYAyABKAsyHy5jb3Ntb3MuZ292LnYxYmV0YTEuVGFsbHlQYXJhbXNCBMjeHwBSC3RhbGx5UGFyYW1z');
@$core.Deprecated('Use queryDepositRequestDescriptor instead')
const QueryDepositRequest$json = const {
  '1': 'QueryDepositRequest',
  '2': const [
    const {'1': 'proposal_id', '3': 1, '4': 1, '5': 4, '10': 'proposalId'},
    const {'1': 'depositor', '3': 2, '4': 1, '5': 9, '10': 'depositor'},
  ],
  '7': const {},
};

/// Descriptor for `QueryDepositRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDepositRequestDescriptor = $convert.base64Decode('ChNRdWVyeURlcG9zaXRSZXF1ZXN0Eh8KC3Byb3Bvc2FsX2lkGAEgASgEUgpwcm9wb3NhbElkEhwKCWRlcG9zaXRvchgCIAEoCVIJZGVwb3NpdG9yOgiIoB8A6KAfAA==');
@$core.Deprecated('Use queryDepositResponseDescriptor instead')
const QueryDepositResponse$json = const {
  '1': 'QueryDepositResponse',
  '2': const [
    const {'1': 'deposit', '3': 1, '4': 1, '5': 11, '6': '.cosmos.gov.v1beta1.Deposit', '8': const {}, '10': 'deposit'},
  ],
};

/// Descriptor for `QueryDepositResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDepositResponseDescriptor = $convert.base64Decode('ChRRdWVyeURlcG9zaXRSZXNwb25zZRI7CgdkZXBvc2l0GAEgASgLMhsuY29zbW9zLmdvdi52MWJldGExLkRlcG9zaXRCBMjeHwBSB2RlcG9zaXQ=');
@$core.Deprecated('Use queryDepositsRequestDescriptor instead')
const QueryDepositsRequest$json = const {
  '1': 'QueryDepositsRequest',
  '2': const [
    const {'1': 'proposal_id', '3': 1, '4': 1, '5': 4, '10': 'proposalId'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryDepositsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDepositsRequestDescriptor = $convert.base64Decode('ChRRdWVyeURlcG9zaXRzUmVxdWVzdBIfCgtwcm9wb3NhbF9pZBgBIAEoBFIKcHJvcG9zYWxJZBJGCgpwYWdpbmF0aW9uGAIgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryDepositsResponseDescriptor instead')
const QueryDepositsResponse$json = const {
  '1': 'QueryDepositsResponse',
  '2': const [
    const {'1': 'deposits', '3': 1, '4': 3, '5': 11, '6': '.cosmos.gov.v1beta1.Deposit', '8': const {}, '10': 'deposits'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `QueryDepositsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDepositsResponseDescriptor = $convert.base64Decode('ChVRdWVyeURlcG9zaXRzUmVzcG9uc2USPQoIZGVwb3NpdHMYASADKAsyGy5jb3Ntb3MuZ292LnYxYmV0YTEuRGVwb3NpdEIEyN4fAFIIZGVwb3NpdHMSRwoKcGFnaW5hdGlvbhgCIAEoCzInLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlc3BvbnNlUgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryTallyResultRequestDescriptor instead')
const QueryTallyResultRequest$json = const {
  '1': 'QueryTallyResultRequest',
  '2': const [
    const {'1': 'proposal_id', '3': 1, '4': 1, '5': 4, '10': 'proposalId'},
  ],
};

/// Descriptor for `QueryTallyResultRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTallyResultRequestDescriptor = $convert.base64Decode('ChdRdWVyeVRhbGx5UmVzdWx0UmVxdWVzdBIfCgtwcm9wb3NhbF9pZBgBIAEoBFIKcHJvcG9zYWxJZA==');
@$core.Deprecated('Use queryTallyResultResponseDescriptor instead')
const QueryTallyResultResponse$json = const {
  '1': 'QueryTallyResultResponse',
  '2': const [
    const {'1': 'tally', '3': 1, '4': 1, '5': 11, '6': '.cosmos.gov.v1beta1.TallyResult', '8': const {}, '10': 'tally'},
  ],
};

/// Descriptor for `QueryTallyResultResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTallyResultResponseDescriptor = $convert.base64Decode('ChhRdWVyeVRhbGx5UmVzdWx0UmVzcG9uc2USOwoFdGFsbHkYASABKAsyHy5jb3Ntb3MuZ292LnYxYmV0YTEuVGFsbHlSZXN1bHRCBMjeHwBSBXRhbGx5');
