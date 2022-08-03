part of 'proposals_cubit.dart';

abstract class ProposalsState with EquatableMixin {
  final ProposalsViewModel model;

  const ProposalsState({required this.model});

  @override
  List<Object?> get props => [model];
}

class ProposalsInitial extends ProposalsState {
  ProposalsInitial() : super(model: const ProposalsViewModel());
}

class ProposalsLoadingState extends ProposalsState {
  final bool isRefresh;
  ProposalsLoadingState(
      {required ProposalsViewModel model, this.isRefresh = false})
      : super(model: model);

  @override
  List<Object?> get props => [isRefresh, model];
}

class ProposalsPrimaryState extends ProposalsState {
  ProposalsPrimaryState({required ProposalsViewModel model})
      : super(model: model);
}

class ProposalsErrorState extends ProposalsState {
  final BaseDigException exception;

  const ProposalsErrorState(
      {ProposalsViewModel model = const ProposalsViewModel(),
      this.exception = const DigException()})
      : super(model: model);

  @override
  List<Object?> get props => [...super.props, exception];
}
