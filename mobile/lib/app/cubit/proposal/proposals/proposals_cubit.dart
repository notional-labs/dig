import 'package:bloc/bloc.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/page/proposals_flow/proposal_detail/proposal_detail_page.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/app/viewmodel/proposals_viewmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'proposals_state.dart';

@injectable
class ProposalsCubit extends Cubit<ProposalsState> {
  ProposalsCubit(this._getProposalsUseCase) : super(ProposalsInitial());
  final GetProposalsUseCase _getProposalsUseCase;

  Future getProposals([bool isRefresh = false]) async {
    emit(ProposalsLoadingState(model: state.model, isRefresh: isRefresh));
    final result = await _getProposalsUseCase
        .call(const GetProposalsUseCaseParam(request: ProposalsRequest()));
    result.fold(_handleGetProposalsFailure, _handleGetProposalsSuccess);
  }

  Future refreshEvent() => getProposals(true);

  void _handleGetProposalsSuccess(List<Proposal> proposals) {
    emit(ProposalsPrimaryState(
        model: state.model.copyWith(proposals: proposals.reversed.toList())));
  }

  void _handleGetProposalsFailure(BaseDigException exception) {
    emit(ProposalsErrorState(exception: exception, model: state.model));
  }

  void onDetailTap(Proposal proposal) {
    navigatorKey.currentState!.pushNamed(DigPageName.proposalDetail,
        arguments: ProposalDetailPageParams(proposal));
  }
}
