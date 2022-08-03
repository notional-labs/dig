// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consensus_pubkey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConsensusPubkey _$ConsensusPubkeyFromJson(Map<String, dynamic> json) =>
    ConsensusPubkey(
      type: json['type'] as String? ?? '',
      value: json['value'] as String? ?? '',
    );

Map<String, dynamic> _$ConsensusPubkeyToJson(ConsensusPubkey instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };
