// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delegation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Delegation _$DelegationFromJson(Map<String, dynamic> json) => Delegation(
      delegatorAddress: json['delegator_address'] as String? ?? '',
      validatorAddress: json['validator_address'] as String? ?? '',
      shares: json['shares'] as String? ?? '',
    );

Map<String, dynamic> _$DelegationToJson(Delegation instance) =>
    <String, dynamic>{
      'delegator_address': instance.delegatorAddress,
      'validator_address': instance.validatorAddress,
      'shares': instance.shares,
    };
