// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Commission _$CommissionFromJson(Map<String, dynamic> json) => Commission(
      commissionRates: json['commission_rates'] == null
          ? const CommissionRates()
          : CommissionRates.fromJson(
              json['commission_rates'] as Map<String, dynamic>),
      updateTime: json['update_time'] as String? ?? '',
    );

Map<String, dynamic> _$CommissionToJson(Commission instance) =>
    <String, dynamic>{
      'commission_rates': instance.commissionRates,
      'update_time': instance.updateTime,
    };
