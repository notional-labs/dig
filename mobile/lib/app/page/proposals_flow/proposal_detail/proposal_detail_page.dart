import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/proposal/proposal_detail/proposal_detail_cubit.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_proposal_percentage_bar.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_proposal_status.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/extension/datetime_extensions.dart';
import 'package:dig_mobile_app/app/extension/string_extension.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/proposal_detail_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProposalDetailPageParams {
  final Proposal proposal;

  const ProposalDetailPageParams(this.proposal);
}

class ProposalDetailPage extends StatefulWidget {
  final ProposalDetailPageParams? params;

  const ProposalDetailPage({this.params, Key? key}) : super(key: key);

  @override
  State<ProposalDetailPage> createState() => _ProposalDetailPageState();
}

class _ProposalDetailPageState extends State<ProposalDetailPage>
    with WidgetUtil {
  final ProposalDetailCubit _cubit = di();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.init(widget.params?.proposal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          body: DSBackground(
        child: SafeArea(
          child: Column(
            children: [
              DSPrimaryAppBar.normal(
                title: S.current.proposal_detail_page_title,
                onBackButtonPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 38),
              Expanded(
                  child: SingleChildScrollView(
                      child: BlocConsumer<ProposalDetailCubit,
                          ProposalDetailState>(
                bloc: _cubit,
                listener: _listener,
                builder: (_, state) => _buildBody(state.model),
              )))
            ],
          ),
        ),
      )),
    );
  }

  void _listener(_, currentState) {
    if (currentState is ProposalDetailLoadingState) {
      showGlobalLoadingOverlay();
      return;
    }
    dismissGlobalLoadingOverlay();
  }

  Widget _buildBody(ProposalDetailViewModel model) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#${model.proposal.proposalId}',
                style: DSTextStyle.tsMontserratT20B
                    .copyWith(color: DSColors.tulipTree),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    model.proposal.content?.title ?? '',
                    style: DSTextStyle.tsMontserratT16M
                        .copyWith(color: DSColors.tulipTree),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          DSProposalStatus(
            type: model.proposal.proposalStatusType,
          ),
          const SizedBox(
            height: 25,
          ),
          _InfoRowItem(
            name: S.current.proposal_id,
            value: model.proposal.proposalId,
          ),
          _InfoRowItem(
            name: S.current.proposer,
            value: model.proposer,
            valueColor: DSColors.tulipTree,
          ),
          _InfoRowItem(
            name: S.current.total_deposit,
            value: model.totalDeposit.toString(),
          ),
          _InfoRowItem(
            name: S.current.submitted_time,
            value: _toDisplayDateFormat(model.proposal.submitTime),
          ),
          _InfoRowItem(
            name: S.current.voting_time,
            value:
                '${_toDisplayDateFormat(model.proposal.votingStartTime)} - ${_toDisplayDateFormat(model.proposal.votingEndTime)}',
          ),
          _InfoRowItem(
            name: S.current.proposal_type,
            value: model.proposal.content?.type ?? '',
          ),
          _InfoRowItem(
            name: S.current.title,
            value: model.proposal.content?.title ?? '',
          ),
          _InfoRowItem(
            name: S.current.description,
            value: model.proposal.content?.description ?? '',
          ),
          const SizedBox(
            height: 75,
          ),
          Text(
            S.current.vote.toUpperCase(),
            style: DSTextStyle.tsMontserratT20B
                .copyWith(color: DSColors.tulipTree),
          ),
          const SizedBox(
            height: 22,
          ),
          DSProposalPercentageBar(
            yes: model.proposal.votingYesPercent,
            abstain: model.proposal.votingAbstainPercent,
            no: model.proposal.votingNoPercent,
            noWithVeto: model.proposal.votingNoWithVetoPercent,
          )
        ],
      ),
    );
  }

  String _toDisplayDateFormat(String dateString) {
    return dateString.toDateTime()?.toLocal().toYYYYMMddHHmmSS() ?? '';
  }
}

class _InfoRowItem extends StatelessWidget {
  final String name;
  final String value;
  final Color? valueColor;

  const _InfoRowItem(
      {required this.name,
      required this.value,
      this.valueColor = Colors.white,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              name,
              style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white),
            ),
          ),
          Expanded(
              child: Text(
            value,
            style: DSTextStyle.tsMontserratT12R.copyWith(color: valueColor),
          ))
        ],
      ),
    );
  }
}
