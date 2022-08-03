import 'package:dig_core/src/domain/entity/staking/chart_request.dart';
import 'package:dig_core/src/domain/entity/staking/market_chart_price.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/repository/market_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class GetCoinChartUseCase
    extends UseCase<List<MarketChartPrice>, GetCoinChartUseCaseParam> {
  GetCoinChartUseCase(this._repository);
  final MarketRepository _repository;

  @override
  Future<Either<BaseDigException, List<MarketChartPrice>>> call(
      GetCoinChartUseCaseParam params) async {
    try {
      final result = await _repository.getChart(params.param);
      return Right(result.getPrices());
    } catch (e, trace) {
      Logger().e('GetCoinChartUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetCoinChartUseCaseParam {
  final ChartRequest param;
  GetCoinChartUseCaseParam({
    required this.param,
  });
}
