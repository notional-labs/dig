// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposals_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalsResponse _$ProposalsResponseFromJson(Map<String, dynamic> json) =>
    ProposalsResponse(
      proposals: (json['proposals'] as List<dynamic>?)
              ?.map((e) => Proposal.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Proposal>[],
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProposalsResponseToJson(ProposalsResponse instance) =>
    <String, dynamic>{
      'proposals': instance.proposals,
      'pagination': instance.pagination,
    };
