import 'package:dig_core/src/domain/entity/import_account.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:transaction_signing_gateway/model/account_public_info.dart';

@injectable
class ImportAccountUseCase
    extends UseCase<AccountPublicInfo, ImportAccountUseCaseParam> {
  final AuthRepository _repository;
  final ENV _env;

  ImportAccountUseCase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, AccountPublicInfo>> call(
      ImportAccountUseCaseParam params) async {
    try {
      _repository.createChainENV(params.chain ?? _env.digChain);
      final result = await _repository.importAccount(params.importAccount);
      return Right(result);
    } catch (e, trace) {
      Logger().e('ImportAccountUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class ImportAccountUseCaseParam {
  final ImportAccount importAccount;
  final ChainENV? chain;

  const ImportAccountUseCaseParam({required this.importAccount, this.chain});
}
