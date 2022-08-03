// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delegator_rewards_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DelegatorRewardsResponse _$DelegatorRewardsResponseFromJson(
        Map<String, dynamic> json) =>
    DelegatorRewardsResponse(
      rewards: (json['rewards'] as List<dynamic>?)
              ?.map((e) => RewardData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <RewardData>[],
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DelegatorRewardsResponseToJson(
        DelegatorRewardsResponse instance) =>
    <String, dynamic>{
      'rewards': instance.rewards,
      'pagination': instance.pagination,
    };
