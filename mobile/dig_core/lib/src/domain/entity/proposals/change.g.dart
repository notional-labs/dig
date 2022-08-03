// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Change _$ChangeFromJson(Map<String, dynamic> json) => Change(
      subspace: json['subspace'] as String? ?? '',
      key: json['key'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$ChangeToJson(Change instance) => <String, dynamic>{
      'subspace': instance.subspace,
      'key': instance.key,
      'value': instance.value,
    };
