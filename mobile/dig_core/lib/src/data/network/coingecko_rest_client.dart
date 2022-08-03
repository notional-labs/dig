import 'package:dig_core/src/data/definition/definition.dart';
import 'package:dig_core/src/domain/entity/staking/market.dart';
import 'package:dig_core/src/domain/entity/staking/market_chart.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'coingecko_rest_client.g.dart';

@RestApi(parser: Parser.JsonSerializable, autoCastResponse: true)
abstract class CoingeckoRestClient {
  factory CoingeckoRestClient.from(Dio dio, ENV env) =>
      _CoingeckoRestClient(dio, baseUrl: env.coingeckoBaseUrl);

  @GET(EndPoint.market)
  Future<List<Market>> getBalances(
      {@Query('ids') required String ids,
      @Query('vs_currency') required String vs_currency});

  @GET(EndPoint.marketChart)
  Future<MarketChart> getMarketChart(
      {@Path('id') required String id,
      @Query('vs_currency') required String vs_currency,
      @Query('days') required String days});
}
