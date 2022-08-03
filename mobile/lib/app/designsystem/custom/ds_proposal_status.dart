import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class DSProposalStatus extends StatelessWidget {
  final ProposalStatusType type;
  final double? withOpacity;

  const DSProposalStatus(
      {this.type = ProposalStatusType.unrecognized, this.withOpacity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: _getStatusColor().withOpacity(withOpacity ?? 1.0)),
      child: Text(
        _getStatusLabel(),
        style: DSTextStyle.tsMontserratT16R.copyWith(
            color: withOpacity == null ? Colors.white : _getStatusColor()),
      ),
    );
  }

  String _getStatusLabel() {
    switch (type) {
      case ProposalStatusType.depositPeriod:
        return S.current.proposal_status_deposit;
      case ProposalStatusType.votingPeriod:
        return S.current.proposal_status_voting;
      case ProposalStatusType.passed:
        return S.current.proposal_status_passed;
      case ProposalStatusType.rejected:
        return S.current.proposal_status_rejected;
      case ProposalStatusType.failed:
        return S.current.proposal_status_failed;
      case ProposalStatusType.unrecognized:
        return S.current.proposal_status_unrecognized;
      default:
        return S.current.proposal_status_unrecognized;
    }
  }

  Color _getStatusColor() {
    switch (type) {
      case ProposalStatusType.depositPeriod:
        return DSColors.yellowOrange;
      case ProposalStatusType.votingPeriod:
        return DSColors.moss;
      case ProposalStatusType.passed:
        return DSColors.jungleGreen;
      case ProposalStatusType.rejected:
        return DSColors.burntSienna;
      case ProposalStatusType.failed:
        return DSColors.burntSienna;
      case ProposalStatusType.unrecognized:
        return DSColors.tundora;
      default:
        return DSColors.tundora;
    }
  }
}
