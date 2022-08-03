// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Staking _$StakingFromJson(Map<String, dynamic> json) => Staking(
      height: json['height'] as num? ?? 0,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$StakingToJson(Staking instance) => <String, dynamic>{
      'height': instance.height,
      'result': instance.result,
    };
