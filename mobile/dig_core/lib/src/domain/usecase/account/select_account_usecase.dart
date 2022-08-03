import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/repository/auth_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:transaction_signing_gateway/model/account_public_info.dart';

@injectable
class SelectAccountUseCase extends UseCase<void, SelectAccountUseCaseParam> {
  final AuthRepository _repository;
  SelectAccountUseCase(this._repository);
  @override
  Future<Either<BaseDigException, void>> call(
      SelectAccountUseCaseParam params) async {
    try {
      await _repository.selectAccount(params.accountPublicInfo.accountId);
      return const Right(null);
    } catch (e, trace) {
      Logger().e('SelectAccountUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class SelectAccountUseCaseParam {
  final AccountPublicInfo accountPublicInfo;
  const SelectAccountUseCaseParam({required this.accountPublicInfo});
}
