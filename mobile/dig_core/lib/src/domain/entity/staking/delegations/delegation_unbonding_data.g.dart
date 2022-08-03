// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delegation_unbonding_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DelegationUnBondingData _$DelegationUnBondingDataFromJson(
        Map<String, dynamic> json) =>
    DelegationUnBondingData(
      delegatorAddress: json['delegator_address'] as String? ?? '',
      validatorAddress: json['validator_address'] as String? ?? '',
      entries: (json['entries'] as List<dynamic>?)
              ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Entry>[],
    );

Map<String, dynamic> _$DelegationUnBondingDataToJson(
        DelegationUnBondingData instance) =>
    <String, dynamic>{
      'delegator_address': instance.delegatorAddress,
      'validator_address': instance.validatorAddress,
      'entries': instance.entries,
    };
