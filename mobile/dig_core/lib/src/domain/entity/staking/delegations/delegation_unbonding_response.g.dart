// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delegation_unbonding_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DelegationUnBondingResponse _$DelegationUnBondingResponseFromJson(
        Map<String, dynamic> json) =>
    DelegationUnBondingResponse(
      unbondingResponses: (json['unbonding_responses'] as List<dynamic>?)
              ?.map((e) =>
                  DelegationUnBondingData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <DelegationUnBondingData>[],
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DelegationUnBondingResponseToJson(
        DelegationUnBondingResponse instance) =>
    <String, dynamic>{
      'unbonding_responses': instance.unbondingResponses,
      'pagination': instance.pagination,
    };
