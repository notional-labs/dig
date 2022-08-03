import 'package:dig_core/src/domain/entity/staking/chart_request.dart';
import 'package:dig_core/src/domain/entity/staking/coin_request.dart';
import 'package:dig_core/src/domain/entity/staking/market.dart';
import 'package:dig_core/src/domain/entity/staking/market_chart.dart';

abstract class MarketRepository {
  Future<List<Market>> getCoin(CoinRequest param);
  Future<MarketChart> getChart(ChartRequest param);
}
