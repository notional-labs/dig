import 'package:dig_core/src/data/datasource/remote/proposals_remote_datasource.dart';
import 'package:dig_core/src/domain/entity/proposals/proposals_request.dart';
import 'package:dig_core/src/domain/entity/proposals/proposals_response.dart';
import 'package:dig_core/src/domain/entity/proposals/proposer_request.dart';
import 'package:dig_core/src/domain/entity/proposals/proposer_response.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:dig_core/src/domain/repository/proposals_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProposalsRepository)
class ProposalsRepositoryImplement implements ProposalsRepository {
  final ProposalsRemoteDatasource _datasource;

  ProposalsRepositoryImplement(this._datasource);

  @override
  ChainENV createChainENV(ChainENV chain) => _datasource.createChain(chain);

  @override
  Future<ProposalsResponse> getProposals(ProposalsRequest param) =>
      _datasource.getProposals(param);

  @override
  Future<ProposerResponse> getProposer(ProposerRequest param) =>
      _datasource.getProposer(param);
}
