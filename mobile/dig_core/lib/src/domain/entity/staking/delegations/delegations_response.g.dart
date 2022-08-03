// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delegations_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DelegationsResponse _$DelegationsResponseFromJson(Map<String, dynamic> json) =>
    DelegationsResponse(
      delegationResponses: (json['delegation_responses'] as List<dynamic>?)
              ?.map((e) => DelegationData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DelegationData>[],
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DelegationsResponseToJson(
        DelegationsResponse instance) =>
    <String, dynamic>{
      'delegation_responses': instance.delegationResponses,
      'pagination': instance.pagination,
    };
