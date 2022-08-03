part of 'create_proposal_cubit.dart';

abstract class CreateProposalState with EquatableMixin {
  final CreateProposalViewModel viewModel;

  const CreateProposalState({required this.viewModel});

  @override
  List<Object?> get props => [viewModel];
}

class CreateProposalInitial extends CreateProposalState {
  CreateProposalInitial() : super(viewModel: const CreateProposalViewModel());
}
