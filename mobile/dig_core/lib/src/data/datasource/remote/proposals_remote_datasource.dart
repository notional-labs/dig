import 'package:dig_core/src/data/extension/extension.dart';
import 'package:dig_core/src/domain/entity/proposals/proposals_request.dart';
import 'package:dig_core/src/domain/entity/proposals/proposals_response.dart';
import 'package:dig_core/src/domain/entity/proposals/proposer_request.dart';
import 'package:dig_core/src/domain/entity/proposals/proposer_response.dart';
import 'package:dig_core/src/domain/env/env.dart';
import 'package:injectable/injectable.dart';

abstract class ProposalsRemoteDatasource {
  ChainENV createChain(ChainENV chain);

  Future<ProposalsResponse> getProposals(ProposalsRequest param);

  Future<ProposerResponse> getProposer(ProposerRequest param);
}

@Injectable(as: ProposalsRemoteDatasource)
class ProposalsRemoteDatasourceImplement implements ProposalsRemoteDatasource {
  ChainENV? _chain;

  @override
  ChainENV createChain(ChainENV chain) {
    _chain ??= chain;
    return _chain!;
  }

  @override
  Future<ProposalsResponse> getProposals(ProposalsRequest param) {
    assert(_chain != null,
        '`_chain` must be not null. Ensure called `createChain` first');
    final restClient = _chain!.getRestClient();
    return restClient.getProposals(
        nextPageKey: param.nextPageKey, limit: param.limit);
  }

  @override
  Future<ProposerResponse> getProposer(ProposerRequest param) {
    assert(_chain != null,
        '`_chain` must be not null. Ensure called `createChain` first');
    final restClient = _chain!.getRestClient();
    return restClient.getProposer(proposerId: param.proposerId);
  }
}
