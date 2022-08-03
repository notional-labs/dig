import 'package:dig_core/src/data/network/coingecko_rest_client.dart';
import 'package:dig_core/src/domain/entity/staking/chart_request.dart';
import 'package:dig_core/src/domain/entity/staking/coin_request.dart';
import 'package:dig_core/src/domain/entity/staking/market.dart';
import 'package:dig_core/src/domain/entity/staking/market_chart.dart';
import 'package:injectable/injectable.dart';

abstract class MarketRemoteDatasource {
  Future<List<Market>> getCoin(CoinRequest param);
  Future<MarketChart> getChart(ChartRequest param);
}

@Injectable(as: MarketRemoteDatasource)
class MarketRemoteDatasourceImplemet implements MarketRemoteDatasource {
  final CoingeckoRestClient _client;
  MarketRemoteDatasourceImplemet(this._client);

  @override
  Future<List<Market>> getCoin(CoinRequest param) =>
      _client.getBalances(ids: param.ids, vs_currency: param.vs_currency);

  @override
  Future<MarketChart> getChart(ChartRequest param) => _client.getMarketChart(
      id: param.id, vs_currency: param.vs_currency, days: param.days);
}
