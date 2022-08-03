// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StakingResponse _$StakingResponseFromJson(Map<String, dynamic> json) =>
    StakingResponse(
      height: json['height'] as num? ?? 0,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$StakingResponseToJson(StakingResponse instance) =>
    <String, dynamic>{
      'height': instance.height,
      'result': instance.result,
    };
