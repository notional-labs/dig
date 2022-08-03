// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommissionRates _$CommissionRatesFromJson(Map<String, dynamic> json) =>
    CommissionRates(
      rate: json['rate'] as String? ?? '',
      maxRate: json['max_rate'] as String? ?? '',
      maxChangeRate: json['max_change_rate'] as String? ?? '',
    );

Map<String, dynamic> _$CommissionRatesToJson(CommissionRates instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'max_rate': instance.maxRate,
      'max_change_rate': instance.maxChangeRate,
    };
