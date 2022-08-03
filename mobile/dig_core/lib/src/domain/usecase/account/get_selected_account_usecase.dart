import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_core/src/domain/definition/definition.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:collection/collection.dart';

@injectable
class GetSelectedAccountUseCase
    extends UseCase<AccountPublicInfo, GetSelectedAccountUseCaseParam> {
  final AuthRepository _repository;
  final ENV _env;
  GetSelectedAccountUseCase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, AccountPublicInfo>> call(
      GetSelectedAccountUseCaseParam params) async {
    try {
      _repository.createChainENV(params.chain ?? _env.digChain);
      final accounts = await _repository.getAccountList();
      final accountIdSelected = await _repository.getLastSelectedAccountId();

      if (accounts.isEmpty) {
        throw Exception(DomainErrorMessage.noAccountFound);
      }

      final account = accounts.firstWhereOrNull(
          (element) => element.accountId == accountIdSelected);

      if (account == null) {
        return Right(accounts.first);
      }
      return Right(account);
    } catch (e, trace) {
      Logger().e('GetSelectedAccountUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetSelectedAccountUseCaseParam {
  final ChainENV? chain;

  const GetSelectedAccountUseCaseParam({this.chain});
}
