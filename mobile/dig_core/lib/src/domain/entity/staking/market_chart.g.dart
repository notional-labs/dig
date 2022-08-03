// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketChart _$MarketChartFromJson(Map<String, dynamic> json) => MarketChart(
      prices: (json['prices'] as List<dynamic>?)
              ?.map((e) => e as List<dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MarketChartToJson(MarketChart instance) =>
    <String, dynamic>{
      'prices': instance.prices,
    };
