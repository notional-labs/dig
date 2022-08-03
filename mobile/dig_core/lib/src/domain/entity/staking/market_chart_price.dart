import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market_chart_price.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MarketChartPrice extends Equatable {
  final int timestamp;
  final num price;
  const MarketChartPrice({
    this.timestamp = 0,
    this.price = 0,
  });

  factory MarketChartPrice.fromJson(Map<String, dynamic> json) =>
      _$MarketChartPriceFromJson(json);

  Map<String, dynamic> toJson() => _$MarketChartPriceToJson(this);

  MarketChartPrice copyWith({
    int? timestamp,
    num? price,
  }) {
    return MarketChartPrice(
      timestamp: timestamp ?? this.timestamp,
      price: price ?? this.price,
    );
  }

  @override
  List<Object> get props => [timestamp, price];
}
