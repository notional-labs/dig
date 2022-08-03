// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      name: json['name'] as String? ?? '',
      time: json['time'] as String? ?? '',
      height: json['height'] as String? ?? '',
      info: json['info'] as String? ?? '',
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'name': instance.name,
      'time': instance.time,
      'height': instance.height,
      'info': instance.info,
    };
