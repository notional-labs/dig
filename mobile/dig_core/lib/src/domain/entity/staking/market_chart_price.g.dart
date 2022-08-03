// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_chart_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketChartPrice _$MarketChartPriceFromJson(Map<String, dynamic> json) =>
    MarketChartPrice(
      timestamp: json['timestamp'] as int? ?? 0,
      price: json['price'] as num? ?? 0,
    );

Map<String, dynamic> _$MarketChartPriceToJson(MarketChartPrice instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'price': instance.price,
    };
