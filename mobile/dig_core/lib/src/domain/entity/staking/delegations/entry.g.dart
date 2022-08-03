// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entry _$EntryFromJson(Map<String, dynamic> json) => Entry(
      creationHeight: json['creation_height'] as String? ?? '',
      completionTime: json['completion_time'] == null
          ? null
          : DateTime.parse(json['completion_time'] as String),
      initialBalance: json['initial_balance'] as String? ?? '',
      balance: json['balance'] as String? ?? '',
    );

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'creation_height': instance.creationHeight,
      'completion_time': instance.completionTime?.toIso8601String(),
      'initial_balance': instance.initialBalance,
      'balance': instance.balance,
    };
