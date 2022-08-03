import 'package:dig_core/src/domain/entity/balance.dart';
import 'package:dig_core/src/domain/entity/proposals/content.dart';
import 'package:dig_core/src/domain/entity/proposals/finally_tally_result.dart';
import 'package:dig_core/src/domain/enum/enum.dart';
import 'package:dig_core/src/domain/extension/extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'proposal.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Proposal with EquatableMixin {
  final String proposalId;
  final Content? content;
  final String status;
  final FinalTallyResult? finalTallyResult;
  final String submitTime;
  final String depositEndTime;
  final List<Balance> totalDeposit;
  final String votingStartTime;
  final String votingEndTime;

  const Proposal({
    this.proposalId = '',
    this.content,
    this.status = '',
    this.finalTallyResult,
    this.submitTime = '',
    this.depositEndTime = '',
    this.totalDeposit = const <Balance>[],
    this.votingStartTime = '',
    this.votingEndTime = '',
  });

  factory Proposal.fromJson(Map<String, dynamic> json) =>
      _$ProposalFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalToJson(this);

  @override
  List<Object?> get props => [
        proposalId,
        content,
        status,
        finalTallyResult,
        submitTime,
        depositEndTime,
        totalDeposit,
        votingStartTime,
        votingEndTime
      ];
}

extension ProposalExtensions on Proposal {
  ProposalStatusType get proposalStatusType {
    switch (status) {
      case 'PROPOSAL_STATUS_DEPOSIT_PERIOD':
        return ProposalStatusType.depositPeriod;
      case 'PROPOSAL_STATUS_VOTING_PERIOD':
        return ProposalStatusType.votingPeriod;
      case 'PROPOSAL_STATUS_PASSED':
        return ProposalStatusType.passed;
      case 'PROPOSAL_STATUS_REJECTED':
        return ProposalStatusType.rejected;
      case 'PROPOSAL_STATUS_FAILED':
        return ProposalStatusType.failed;
      default:
        return ProposalStatusType.unrecognized;
    }
  }

  int get _votingSum {
    final sum = (finalTallyResult?.yesByInt ?? 0) +
        (finalTallyResult?.abstainByInt ?? 0) +
        (finalTallyResult?.noByInt ?? 0) +
        (finalTallyResult?.noWithVetoByInt ?? 0);
    return sum == 0 ? 1 : sum;
  }

  double get votingYesPercent {
    return ((finalTallyResult?.yesByInt ?? 0) * 100 / _votingSum)
        .toPrecision(1);
  }

  double get votingAbstainPercent {
    return ((finalTallyResult?.abstainByInt ?? 0) * 100 / _votingSum)
        .toPrecision(1);
  }

  double get votingNoPercent {
    return ((finalTallyResult?.noByInt ?? 0) * 100 / _votingSum).toPrecision(1);
  }

  double get votingNoWithVetoPercent {
    return ((finalTallyResult?.noWithVetoByInt ?? 0) * 100 / _votingSum)
        .toPrecision(1);
  }
}
