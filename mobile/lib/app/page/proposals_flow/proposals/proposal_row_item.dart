import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_proposal_percentage_bar.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_proposal_status.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_small_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/extension/extension.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProposalRowItem extends StatelessWidget {
  final Function? onDetailTap;
  final Proposal proposal;

  const ProposalRowItem({required this.proposal, this.onDetailTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 14, right: 14, top: 14, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#${proposal.proposalId}',
                      style: DSTextStyle.tsMontserratT20B
                          .copyWith(color: Colors.black),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 2),
                        child: Text(
                          proposal.content?.title ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: DSTextStyle.tsMontserratT16R
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                DSProposalStatus(
                  type: proposal.proposalStatusType,
                  withOpacity: 0.3,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  proposal.content?.description ?? '',
                  style: DSTextStyle.tsMontserratT12R,
                  maxLines: 15,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  children: [
                    Expanded(
                        child: _ProposalDate(
                      title: S.current.submit_date,
                      date: proposal.submitTime,
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: _ProposalDate(
                      title: S.current.start_date,
                      date: proposal.votingStartTime,
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: _ProposalDate(
                      title: S.current.end_date,
                      date: proposal.votingEndTime,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                DSProposalPercentageBar(
                  yes: proposal.votingYesPercent,
                  abstain: proposal.votingAbstainPercent,
                  no: proposal.votingNoPercent,
                  noWithVeto: proposal.votingNoWithVetoPercent,
                )
              ],
            ),
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
                color: DSColors.silver2.withOpacity(0.3),
                borderRadius: const BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(10),
                    bottomEnd: Radius.circular(10))),
            child: Row(
              children: [
                const SizedBox(
                  width: 14,
                ),
                DSSmallButton(
                  title: S.current.proposals_item_detail_text,
                  onTap: () => onDetailTap?.call(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ProposalDate extends StatelessWidget {
  final String title;
  final String date;

  const _ProposalDate({required this.title, required this.date, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: DSColors.yellowOrange),
      child: Column(
        children: [
          Text(
            title,
            style: DSTextStyle.tsMontserratT10R,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            date.toDateTime()?.toYYYYMMdd() ?? '',
            style: DSTextStyle.tsMontserratT10B,
          ),
        ],
      ),
    );
  }
}
