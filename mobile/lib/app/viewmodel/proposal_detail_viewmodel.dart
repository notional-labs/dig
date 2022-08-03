import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:equatable/equatable.dart';
import 'package:collection/collection.dart';

class ProposalDetailViewModel with EquatableMixin {
  final Proposal proposal;
  final String proposer;

  const ProposalDetailViewModel(
      {this.proposal = const Proposal(), this.proposer = ''});

  ProposalDetailViewModel copyWith({Proposal? proposal, String? proposer}) =>
      ProposalDetailViewModel(
          proposal: proposal ?? this.proposal,
          proposer: proposer ?? this.proposer);

  int get totalDeposit {
    final balance = proposal.totalDeposit
        .firstWhereOrNull((element) => Denom.udig == element.denom);
    return (double.tryParse(balance?.amount ?? '') ?? 0) ~/
        TokenBalanceRatio.ratio;
  }

  @override
  List<Object?> get props => [proposal, proposer];
}
