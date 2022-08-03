import 'package:dig_mobile_app/app/cubit/proposal/proposals/proposals_cubit.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_refresh_cupertino_sliver.dart';
import 'package:dig_mobile_app/app/designsystem/ds_snack_bar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/page/proposals_flow/create_proposal/create_proposal_widget.dart';
import 'package:dig_mobile_app/app/page/proposals_flow/proposals/proposal_row_item.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/proposals_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProposalsPage extends StatefulWidget {
  const ProposalsPage({Key? key}) : super(key: key);

  @override
  State<ProposalsPage> createState() => _ProposalsPageState();
}

class _ProposalsPageState extends State<ProposalsPage>
    with WidgetUtil, AutomaticKeepAliveClientMixin {
  final ProposalsCubit _cubit = di();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.getProposals();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<ProposalsCubit, ProposalsState>(
      bloc: _cubit,
      listener: _listener,
      builder: (_, state) => _buildBody(state.model),
    );
  }

  void _listener(_, currentState) {
    if (currentState is ProposalsLoadingState && !currentState.isRefresh) {
      showGlobalLoadingOverlay();
      return;
    }
    dismissGlobalLoadingOverlay();
    if (currentState is ProposalsErrorState) {
      showGlobalDSSnackBar(
          message: currentState.exception.message, type: DSSnackBarType.error);
      return;
    }
  }

  Widget _buildBody(ProposalsViewModel model) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Column(
        children: [
          Text(
            S.current.proposals.toUpperCase(),
            style: DSTextStyle.tsMontserratT32B
                .copyWith(color: DSColors.tulipTree),
          ),
          const SizedBox(
            height: 6,
          ),
          DSPrimaryButton(
              title: S.current.create_proposal,
              leftIcon: const Icon(
                Icons.add,
                size: 14,
                color: Colors.white,
              ),
              width: 120,
              height: 30,
              textStyle:
                  DSTextStyle.tsMontserratT10R.copyWith(color: Colors.white),
              onTap: () {
                showFullScreenDialog(
                    context: context,
                    child: const CreateProposalWidget(
                      param: CreateProposalWidgetParam(),
                    ));
              }),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: _buildScrollWidget(model)),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget _buildScrollWidget(ProposalsViewModel model) => CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: () {
              return _cubit.refreshEvent();
            },
            builder: (
              BuildContext context,
              RefreshIndicatorMode refreshState,
              double pulledExtent,
              double refreshTriggerPullDistance,
              double refreshIndicatorExtent,
            ) =>
                buildDSRefreshCupertinoSliver(
                    context,
                    refreshState,
                    pulledExtent,
                    refreshTriggerPullDistance,
                    refreshIndicatorExtent),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                ((context, index) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ProposalRowItem(
                          proposal: model.proposals[index],
                          onDetailTap: () =>
                              _cubit.onDetailTap(model.proposals[index]),
                        ),
                        if (index != model.proposals.length - 1)
                          const SizedBox(height: 25)
                      ],
                    )),
                childCount: model.proposals.length),
          ),
        ],
      );

  @override
  bool get wantKeepAlive => true;
}
