// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposer_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposerResult _$ProposerResultFromJson(Map<String, dynamic> json) =>
    ProposerResult(
      proposalId: json['proposal_id'] as String? ?? '',
      proposer: json['proposer'] as String? ?? '',
    );

Map<String, dynamic> _$ProposerResultToJson(ProposerResult instance) =>
    <String, dynamic>{
      'proposal_id': instance.proposalId,
      'proposer': instance.proposer,
    };
