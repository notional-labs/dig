import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_primary_avatar.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_wallet_address.dart';
import 'package:dig_mobile_app/app/designsystem/ds_refresh_cupertino_sliver.dart';
import 'package:dig_mobile_app/app/designsystem/ds_snack_bar.dart';
import 'package:dig_mobile_app/app/extension/extension.dart';
import 'package:dig_mobile_app/app/page/active_account/transfer_token/transfer_token_widget.dart';
import 'package:dig_mobile_app/app/page/receive_token/receive_token_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dig_mobile_app/app/cubit/active_account/active_account_cubit.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_rounded_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_expandable_page_view.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/page/active_account/real_estate_list_tab/real_estate_list_tab_page.dart';
import 'package:dig_mobile_app/app/page/active_account/tokens_holding_list_tab/tokens_holding_list_tab_page.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/active_account_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';

import 'package:dig_mobile_app/app/route/dig_route.dart';

typedef OnRemoveAccount = Function(AccountPublicInfo account);

class ActiveAccountPage extends StatefulWidget {
  final OnRemoveAccount onRemoveAccount;
  final AccountPublicInfo account;
  final List<Balance> balances;

  const ActiveAccountPage(
      {required this.account,
      required this.onRemoveAccount,
      this.balances = const [],
      Key? key})
      : super(key: key);

  @override
  State<ActiveAccountPage> createState() => _ActiveAccountPageState();
}

class _ActiveAccountPageState extends State<ActiveAccountPage>
    with
        SingleTickerProviderStateMixin,
        WidgetUtil,
        AutomaticKeepAliveClientMixin {
  final ActiveAccountCubit _cubit = di();
  final PageController _pageController = PageController();
  final DSWalletAddressController _dsWalletAddressController =
      DSWalletAddressController();
  late TabController _tabController;
  AccountPublicInfo? _lastAccountPublicInfo;

  void _fetchData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_lastAccountPublicInfo?.accountId != widget.account.accountId) {
        _cubit.resetData();
        _dsWalletAddressController.reset();
        _cubit.fetchData(account: widget.account);
        _lastAccountPublicInfo = widget.account;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _cubit.init(widget.balances);
    });
  }

  @override
  void didUpdateWidget(covariant ActiveAccountPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<ActiveAccountCubit, ActiveAccountState>(
      bloc: _cubit,
      listener: _cubitListener,
      builder: (context, state) => _buildRefreshableWidget(state.viewModel),
    );
  }

  void _cubitListener(_, state) {
    if (state is ActiveAccountLoadingState && !state.isRefresh) {
      showGlobalLoadingOverlay();
      return;
    }
    dismissGlobalLoadingOverlay();
    if (state is ActiveAccountErrorState) {
      showGlobalDSSnackBar(
          message: state.exception.message, type: DSSnackBarType.error);
      return;
    }
    if (state is ActiveAccountScannedBarcodeState) {
      _showTransferTokenDialog(
          digBalance: state.viewModel.balances.getDigBalance(),
          toAddress: state.barCode);
      return;
    }
  }

  Widget _buildRefreshableWidget(ActiveAccountViewModel viewModel) =>
      CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: () {
              return _cubit.refreshEvent(widget.account);
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
          SliverToBoxAdapter(
            child: _buildBody(viewModel),
          )
        ],
      );

  Widget _buildBody(ActiveAccountViewModel viewModel) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 40, bottom: 20),
          child: DSPrimaryAvatar(
            backgroundColor: DSColors.silver2,
          ),
        ),
        GestureDetector(
          onTap: () => navigatorKey.currentState!
              .pushNamed(DigPageName.activeAccountDetail),
          child: Text(
            widget.account.name,
            style: DSTextStyle.tsMontserratT20R
                .copyWith(color: DSColors.tulipTree),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          S.current.dig_token_format(
              viewModel.balances.getDigBalance().toDigTokenDisplay()),
          style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 86),
          child: DSWalletAddress(
            controller: _dsWalletAddressController,
            address: widget.account.publicAddress,
            onCopyToClipboardTap: (address) =>
                _cubit.copyAddressToClipboard(address),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, left: 54, right: 54, bottom: 34),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DSRoundedButton(
                actionType: DSRoundedButtonActionType.receive,
                onTap: () {
                  showCenterDialog(
                      context: context,
                      child: ReceiveTokenDialog(
                        address: widget.account.publicAddress,
                        onCopyToClipboardTap: (address) =>
                            _cubit.copyAddressToClipboard(address),
                        onShareAddressTap: (address) =>
                            _cubit.onShareAddress(address),
                        onScanQrCodeTap: () => _cubit.onScanQrCodeTap(),
                      ));
                },
              ),
              DSRoundedButton(
                actionType: DSRoundedButtonActionType.send,
                onTap: () => _showTransferTokenDialog(
                    digBalance: viewModel.balances.getDigBalance()),
              ),
              const DSRoundedButton(
                actionType: DSRoundedButtonActionType.exchange,
              ),
              DSRoundedButton(
                actionType: DSRoundedButtonActionType.remove,
                onTap: () {
                  showActionDialog(
                      context: context,
                      title: S.current.remove_account,
                      message: S
                          .current.are_you_sure_you_want_to_remove_this_account,
                      leftActTitle: S.current.cancel,
                      rightActTitle: S.current.remove,
                      onLeftTap: () {
                        Navigator.of(context).pop();
                      },
                      onRightTap: () {
                        widget.onRemoveAccount(widget.account);
                        Navigator.of(context).pop();
                      });
                },
              )
            ],
          ),
        ),
        _buildTab(viewModel)
      ],
    );
  }

  Widget _buildTab(ActiveAccountViewModel model) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            onTap: (index) {
              setState(() {
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic);
              });
            },
            indicatorColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            tabs: [
              Tab(
                child: _TabItem(
                  text: S.current.token,
                  isSelected: _tabController.index == 0,
                ),
              ),
              Tab(
                child: _TabItem(
                  text: S.current.real_estate,
                  isSelected: _tabController.index == 1,
                ),
              ),
            ],
          ),
          DSExpandablePageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _tabController.animateTo(index);
              });
            },
            children: const [
              TokensHoldingListTabPage(),
              RealEstateListTabPage(),
            ],
          ),
        ],
      ),
    );
  }

  Future _showTransferTokenDialog(
      {required double digBalance, String? toAddress}) async {
    final transferResult = await showFullScreenDialog(
        context: context,
        child: TransferTokenWidget(
          param: TransferTokenWidgetParam(
              account: widget.account,
              tokenAvailable: digBalance,
              toAddress: toAddress),
        ));

    if (transferResult) {
      _cubit.refreshEvent(widget.account);
    }
  }

  @override
  bool get wantKeepAlive => true;
}

class _TabItem extends StatelessWidget {
  final bool isSelected;
  final String text;

  const _TabItem({required this.text, this.isSelected = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      width: 106,
      decoration: BoxDecoration(
        color: isSelected ? DSColors.tulipTree : DSColors.silver2,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Text(
        text,
        style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white),
      )),
    );
  }
}
