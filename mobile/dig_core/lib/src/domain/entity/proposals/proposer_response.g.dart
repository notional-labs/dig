// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposerResponse _$ProposerResponseFromJson(Map<String, dynamic> json) =>
    ProposerResponse(
      json['height'] as String,
      ProposerResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProposerResponseToJson(ProposerResponse instance) =>
    <String, dynamic>{
      'height': instance.height,
      'result': instance.result,
    };
