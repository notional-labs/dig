// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finally_tally_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinalTallyResult _$FinalTallyResultFromJson(Map<String, dynamic> json) =>
    FinalTallyResult(
      yes: json['yes'] as String? ?? '',
      abstain: json['abstain'] as String? ?? '',
      no: json['no'] as String? ?? '',
      noWithVeto: json['no_with_veto'] as String? ?? '',
    );

Map<String, dynamic> _$FinalTallyResultToJson(FinalTallyResult instance) =>
    <String, dynamic>{
      'yes': instance.yes,
      'abstain': instance.abstain,
      'no': instance.no,
      'no_with_veto': instance.noWithVeto,
    };
