import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_core/src/domain/repository/proposals_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class GetProposerUseCase extends UseCase<String, GetProposerUseCaseParam> {
  final ProposalsRepository _repository;
  final ENV _env;

  GetProposerUseCase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, String>> call(
      GetProposerUseCaseParam params) async {
    try {
      _repository.createChainENV(params.chain ?? _env.digChain);
      final result = await _repository.getProposer(params.request);
      return Right(result.result.proposer);
    } catch (e, trace) {
      Logger().e('GetProposerUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetProposerUseCaseParam {
  final ProposerRequest request;
  final ChainENV? chain;

  const GetProposerUseCaseParam({required this.request, this.chain});
}
