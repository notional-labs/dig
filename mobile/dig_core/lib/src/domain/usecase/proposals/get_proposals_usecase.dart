import 'package:dartz/dartz.dart';
import 'package:dig_core/src/domain/entity/proposals/proposal.dart';
import 'package:dig_core/src/domain/entity/proposals/proposals_request.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/exception/dig_exception.dart';
import 'package:dig_core/src/domain/repository/proposals_repository.dart';
import 'package:dig_core/src/domain/usecase/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class GetProposalsUseCase
    extends UseCase<List<Proposal>, GetProposalsUseCaseParam> {
  final ProposalsRepository _repository;
  final ENV _env;

  GetProposalsUseCase(this._repository, this._env);

  @override
  Future<Either<BaseDigException, List<Proposal>>> call(
      GetProposalsUseCaseParam params) async {
    try {
      _repository.createChainENV(params.chain ?? _env.digChain);
      final result = await _repository.getProposals(params.request);
      return Right(result.proposals);
    } catch (e, trace) {
      Logger().e('GetProposalsUseCase ERROR', e, trace);
      return Left(exceptionHandler.handler(e));
    }
  }
}

class GetProposalsUseCaseParam {
  final ProposalsRequest request;
  final ChainENV? chain;

  const GetProposalsUseCaseParam({required this.request, this.chain});
}
