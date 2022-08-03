import 'package:dartz/dartz.dart';
import 'package:dig_core/src/data/exception/dig_exception_impl.dart';
import 'package:dig_core/src/domain/definition/definition.dart';
import 'package:dig_core/src/domain/entity/balance.dart';
import 'package:dig_core/src/domain/entity/balance_resquest.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dig_core/src/domain/repository/account_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:collection/collection.dart';

@injectable
class GetBalanceUseCase extends UseCase<Balance, GetBalanceUseCaseParam> {
  final AccountRepository _repository;
  final ENV _env;
  GetBalanceUseCase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, Balance>> call(
      GetBalanceUseCaseParam params) async {
    try {
      _repository.createChainENV(params.chain ?? _env.digChain);
      final result = await _repository.getBalances(params.request);
      final balance = result.balances
          .firstWhereOrNull((element) => element.denom == params.denom);

      if (balance == null) {
        throw const DigException(message: DomainErrorMessage.noBalanceFound);
      }
      return Right(balance);
    } catch (e, trace) {
      Logger().e('GetBalanceUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetBalanceUseCaseParam {
  final String denom;
  final BalanceRequest request;
  final ChainENV? chain;

  const GetBalanceUseCaseParam(
      {required this.denom, required this.request, this.chain});
}
