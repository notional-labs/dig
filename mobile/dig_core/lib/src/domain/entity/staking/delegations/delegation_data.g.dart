// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delegation_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DelegationData _$DelegationDataFromJson(Map<String, dynamic> json) =>
    DelegationData(
      delegation: json['delegation'] == null
          ? null
          : Delegation.fromJson(json['delegation'] as Map<String, dynamic>),
      balance: json['balance'] == null
          ? null
          : Balance.fromJson(json['balance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DelegationDataToJson(DelegationData instance) =>
    <String, dynamic>{
      'delegation': instance.delegation,
      'balance': instance.balance,
    };
