import 'package:dig_core/dig_core.dart';
import 'package:equatable/equatable.dart';

class ProposalsViewModel with EquatableMixin {
  final List<Proposal> proposals;

  const ProposalsViewModel({this.proposals = const <Proposal>[]});

  ProposalsViewModel copyWith({List<Proposal>? proposals}) =>
      ProposalsViewModel(proposals: proposals ?? this.proposals);

  @override
  List<Object?> get props => [proposals];
}
