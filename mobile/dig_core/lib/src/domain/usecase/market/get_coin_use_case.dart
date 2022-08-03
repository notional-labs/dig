import 'package:dig_core/src/domain/entity/staking/coin_request.dart';
import 'package:dig_core/src/domain/entity/staking/market.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/repository/market_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class GetCoinUseCase extends UseCase<List<Market>, GetCoinUseCaseParam> {
  GetCoinUseCase(this._repository);
  final MarketRepository _repository;

  @override
  Future<Either<BaseDigException, List<Market>>> call(
      GetCoinUseCaseParam params) async {
    try {
      final result = await _repository.getCoin(params.param);
      return Right(result);
    } catch (e, trace) {
      Logger().e('GetCoinMarket ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetCoinUseCaseParam {
  final CoinRequest param;
  GetCoinUseCaseParam({
    required this.param,
  });
}
