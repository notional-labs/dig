// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Proposal _$ProposalFromJson(Map<String, dynamic> json) => Proposal(
      proposalId: json['proposal_id'] as String? ?? '',
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      status: json['status'] as String? ?? '',
      finalTallyResult: json['final_tally_result'] == null
          ? null
          : FinalTallyResult.fromJson(
              json['final_tally_result'] as Map<String, dynamic>),
      submitTime: json['submit_time'] as String? ?? '',
      depositEndTime: json['deposit_end_time'] as String? ?? '',
      totalDeposit: (json['total_deposit'] as List<dynamic>?)
              ?.map((e) => Balance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Balance>[],
      votingStartTime: json['voting_start_time'] as String? ?? '',
      votingEndTime: json['voting_end_time'] as String? ?? '',
    );

Map<String, dynamic> _$ProposalToJson(Proposal instance) => <String, dynamic>{
      'proposal_id': instance.proposalId,
      'content': instance.content,
      'status': instance.status,
      'final_tally_result': instance.finalTallyResult,
      'submit_time': instance.submitTime,
      'deposit_end_time': instance.depositEndTime,
      'total_deposit': instance.totalDeposit,
      'voting_start_time': instance.votingStartTime,
      'voting_end_time': instance.votingEndTime,
    };
