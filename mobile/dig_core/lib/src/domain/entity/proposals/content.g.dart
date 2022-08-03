// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      type: json['@type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      recipient: json['recipient'] as String? ?? '',
      amount: (json['amount'] as List<dynamic>?)
              ?.map((e) => Balance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Balance>[],
      changes: (json['changes'] as List<dynamic>?)
              ?.map((e) => Change.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Change>[],
      plan: json['plan'] == null
          ? null
          : Plan.fromJson(json['plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      '@type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'recipient': instance.recipient,
      'amount': instance.amount,
      'changes': instance.changes,
      'plan': instance.plan,
    };
