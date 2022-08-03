import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_core/src/domain/definition/definition.dart';
import 'package:dig_core/src/domain/repository/transaction_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:transaction_signing_gateway/model/transaction_response.dart';

@injectable
class SendTokenUsecase
    extends UseCase<TransactionResponse, SendTokenUsecaseParam> {
  final TransactionRepository _repository;
  final ENV _env;
  SendTokenUsecase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, TransactionResponse>> call(
      SendTokenUsecaseParam params) async {
    try {
      _repository.createChainENV(params.chain ?? _env.digChain);
      final result = await _repository.sendToken(params.request);

      if (result == null) {
        throw const DigException(message: DomainErrorMessage.cannotSendToken);
      }

      if (result.data.isNotEmpty) {
        return Right(result);
      }

      throw DigException(message: result.rawLog);
    } catch (e, trace) {
      Logger().e('SendTokenUsecase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class SendTokenUsecaseParam {
  final ChainENV? chain;
  final SendTokenRequest request;
  const SendTokenUsecaseParam({required this.request, this.chain});
}
