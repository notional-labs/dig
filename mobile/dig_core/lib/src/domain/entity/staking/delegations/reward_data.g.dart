// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RewardData _$RewardDataFromJson(Map<String, dynamic> json) => RewardData(
      validatorAddress: json['validator_address'] as String? ?? '',
      reward: json['reward'] == null
          ? null
          : Balance.fromJson(json['reward'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RewardDataToJson(RewardData instance) =>
    <String, dynamic>{
      'validator_address': instance.validatorAddress,
      'reward': instance.reward,
    };
