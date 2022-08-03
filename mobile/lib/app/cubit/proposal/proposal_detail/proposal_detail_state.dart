part of 'proposal_detail_cubit.dart';

@immutable
abstract class ProposalDetailState with EquatableMixin {
  final ProposalDetailViewModel model;

  ProposalDetailState({required this.model});

  @override
  List<Object?> get props => [model];
}

class ProposalDetailInitial extends ProposalDetailState {
  ProposalDetailInitial() : super(model: const ProposalDetailViewModel());
}

class ProposalDetailLoadingState extends ProposalDetailState {
  ProposalDetailLoadingState({required ProposalDetailViewModel model})
      : super(model: model);
}

class ProposalDetailPrimaryState extends ProposalDetailState {
  ProposalDetailPrimaryState({required ProposalDetailViewModel model})
      : super(model: model);
}

class ProposalDetailFailureState extends ProposalDetailState {
  final BaseDigException exception;

  ProposalDetailFailureState(
      {required ProposalDetailViewModel model,
      this.exception = const DigException()})
      : super(model: model);

  @override
  List<Object?> get props => [...super.props, exception];
}
