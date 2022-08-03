import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_core/src/domain/definition/definition.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class GetListAccountUseCase
    extends UseCase<List<AccountPublicInfo>, GetListAccountUseCaseParam> {
  final AuthRepository _repository;
  final ENV _env;
  GetListAccountUseCase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, List<AccountPublicInfo>>> call(
      GetListAccountUseCaseParam params) async {
    try {
      _repository.createChainENV(params.chain ?? _env.digChain);
      final accounts = await _repository.getAccountList();

      if (accounts.isEmpty) {
        throw Exception(DomainErrorMessage.noAccountFound);
      }

      return Right(accounts);
    } catch (e, trace) {
      Logger().e('GetSelectedAccountUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetListAccountUseCaseParam {
  final ChainENV? chain;

  const GetListAccountUseCaseParam({this.chain});
}
