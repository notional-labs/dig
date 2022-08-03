import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/entity/balance.dart';
import 'package:dig_core/src/domain/entity/balance_resquest.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dig_core/src/domain/repository/account_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class GetListBalanceUseCase
    extends UseCase<List<Balance>, GetListBalanceUseCaseParam> {
  final AccountRepository _repository;
  final ENV _env;
  GetListBalanceUseCase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, List<Balance>>> call(
      GetListBalanceUseCaseParam params) async {
    try {
      _repository.createChainENV(params.chain ?? _env.digChain);
      final result = await _repository.getBalances(params.request);
      return Right(result.balances);
    } catch (e, trace) {
      Logger().e('GetListBalanceUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetListBalanceUseCaseParam {
  final BalanceRequest request;
  final ChainENV? chain;

  const GetListBalanceUseCaseParam({required this.request, this.chain});
}
