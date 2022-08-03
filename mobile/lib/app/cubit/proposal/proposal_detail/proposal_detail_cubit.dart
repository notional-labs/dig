import 'package:bloc/bloc.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/viewmodel/proposal_detail_viewmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'proposal_detail_state.dart';

@Injectable()
class ProposalDetailCubit extends Cubit<ProposalDetailState> {
  ProposalDetailCubit(this._getProposerUseCase)
      : super(ProposalDetailInitial());

  final GetProposerUseCase _getProposerUseCase;
  late final Proposal _proposal;

  void init(Proposal? proposal) {
    _proposal = proposal ?? const Proposal();
    _getProposer(_proposal.proposalId);

    emit(ProposalDetailPrimaryState(
        model: state.model.copyWith(proposal: _proposal)));
  }

  Future _getProposer(String proposerId) async {
    emit(ProposalDetailLoadingState(model: state.model));

    final result = await _getProposerUseCase
        .call(GetProposerUseCaseParam(request: ProposerRequest(proposerId)));
    result.fold(_handleGetProposerFailure, _handleGetProposerSuccess);
  }

  void _handleGetProposerSuccess(String proposer) {
    emit(ProposalDetailPrimaryState(
        model: state.model.copyWith(proposer: proposer)));
  }

  void _handleGetProposerFailure(BaseDigException exception) {
    emit(ProposalDetailFailureState(exception: exception, model: state.model));
  }
}
