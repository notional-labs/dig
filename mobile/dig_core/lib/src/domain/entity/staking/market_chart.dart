import 'package:dig_core/src/domain/entity/staking/market_chart_price.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market_chart.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MarketChart extends Equatable {
  final List<List<dynamic>> prices;
  const MarketChart({
    this.prices = const [],
  });

  List<MarketChartPrice> getPrices() => prices
      .map((e) =>
          MarketChartPrice(timestamp: e.first as int, price: e.last as num))
      .toList();

  factory MarketChart.fromJson(Map<String, dynamic> json) =>
      _$MarketChartFromJson(json);

  Map<String, dynamic> toJson() => _$MarketChartToJson(this);

  MarketChart copyWith({
    List<List<MarketChartPrice>>? prices,
  }) {
    return MarketChart(
      prices: prices ?? this.prices,
    );
  }

  @override
  List<Object> get props => [prices];
}
