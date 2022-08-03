// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validator_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidatorResponse _$ValidatorResponseFromJson(Map<String, dynamic> json) =>
    ValidatorResponse(
      height: json['height'] as String? ?? '',
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ValidatorResponseToJson(ValidatorResponse instance) =>
    <String, dynamic>{
      'height': instance.height,
      'result': instance.result,
    };
