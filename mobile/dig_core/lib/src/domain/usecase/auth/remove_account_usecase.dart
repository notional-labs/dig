import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:transaction_signing_gateway/model/account_public_info.dart';

@injectable
class RemoveAccountUseCase extends UseCase<void, RemoveAccountUseCaseParam> {
  final AuthRepository _repository;
  final ENV _env;

  RemoveAccountUseCase(this._repository, this._env);
  @override
  Future<Either<BaseDigException, void>> call(
      RemoveAccountUseCaseParam params) async {
    try {
      _repository.createChainENV(params.chain ?? _env.digChain);
      await _repository.removeAccount(params.accountPublicInfo);
      return const Right(null);
    } catch (e, trace) {
      Logger().e('RemoveAccountUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class RemoveAccountUseCaseParam {
  final AccountPublicInfo accountPublicInfo;
  final ChainENV? chain;

  const RemoveAccountUseCaseParam(
      {required this.accountPublicInfo, this.chain});
}
