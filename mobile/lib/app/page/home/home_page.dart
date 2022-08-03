import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/home/home_cubit.dart';
import 'package:dig_mobile_app/app/cubit/home/home_state.dart';
import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_snack_bar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/extension/extension.dart';
import 'package:dig_mobile_app/app/page/active_account/active_account_page.dart';
import 'package:dig_mobile_app/app/page/active_account/transfer_token/transfer_token_widget.dart';
import 'package:dig_mobile_app/app/page/home/home_drawer.dart';
import 'package:dig_mobile_app/app/page/proposals_flow/proposals/proposals_page.dart';
import 'package:dig_mobile_app/app/page/staking/staking_page.dart';
import 'package:dig_mobile_app/app/util/util.dart';
import 'package:dig_mobile_app/app/viewmodel/home_viewmodel.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetUtil {
  final HomeCubit _cubit = di();
  final PageController _pageController = PageController();

  void _navigate(DrawerMenu drawerMenu) {
    if (!_pageController.hasClients) {
      return;
    }
    switch (drawerMenu) {
      case DrawerMenu.account:
        _pageController.jumpToPage(0);
        break;
      case DrawerMenu.staking:
        _pageController.jumpToPage(1);
        break;
      case DrawerMenu.proposals:
        _pageController.jumpToPage(2);
        break;

      default:
        _pageController.jumpToPage(0);
        break;
    }
  }

  void _cubitListener(BuildContext context, HomeState state) {
    if (state is HomeLoadingState) {
      showGlobalLoadingOverlay();
      return;
    }
    dismissGlobalLoadingOverlay();

    _navigate(state.viewModel.currentDrawerMenu);
    if (state is HomeErrorState) {
      showGlobalDSSnackBar(
          message: state.exception.message, type: DSSnackBarType.error);
      return;
    }
    if (state is HomeScannerBarcodeState) {
      _showTransferTokenDialog(
          digBalance: state.viewModel.balances.getDigBalance(),
          accountPublicInfo: state.viewModel.getAccount,
          toAddress: state.barCode);
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _cubit.init();
    });
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => _cubit,
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle.light,
          child: BlocProvider(
              create: (_) => _cubit,
              child: Scaffold(
                drawer: BlocBuilder<HomeCubit, HomeState>(
                    bloc: _cubit,
                    builder: (context, state) => HomeDrawer(
                          accounts: state.viewModel.accounts,
                          lastAccountSelected: state.viewModel.account,
                          lastSelected: state.viewModel.currentDrawerMenu,
                          onAccountChange: (AccountPublicInfo account) {
                            _cubit.changeAccount(account);
                            Navigator.of(context).pop();
                          },
                          onMenuChange: (DrawerMenu drawerMenu) {
                            _cubit.changeHomePage(drawerMenu);
                          },
                          onNewAccountTap: () {
                            _cubit.goToSignInPage();
                          },
                        )),
                body: DSBackground(
                  child: SafeArea(
                      child: BlocConsumer<HomeCubit, HomeState>(
                    listener: _cubitListener,
                    bloc: _cubit,
                    builder: (BuildContext context, state) {
                      if (state is HomePrimaryState) {
                        return _bodyWidget(state.viewModel);
                      }
                      if (state is HomeErrorState) {
                        return _errorWidget(state);
                      }

                      return const SizedBox.shrink();
                    },
                  )),
                ),
              )),
        ),
      );

  Widget _errorWidget(HomeErrorState state) => Center(
        child: Text(
          state.exception.message,
          textAlign: TextAlign.center,
          style: DSTextStyle.tsMontserratT16M.copyWith(color: Colors.white),
        ),
      );

  Widget _bodyWidget(HomeViewModel viewModel) => Column(
        children: [
          HomeAppBar(
            onScanQrTap: () => _cubit.onScanQrCodeTap(),
          ),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                ActiveAccountPage(
                  account: viewModel.getAccount,
                  balances: viewModel.balances,
                  onRemoveAccount: (AccountPublicInfo account) {
                    _cubit.removeAccount(account);
                  },
                ),
                const StakingPage(),
                const ProposalsPage()
              ],
            ),
          )
        ],
      );

  void _showTransferTokenDialog(
      {required double digBalance,
      required AccountPublicInfo accountPublicInfo,
      String? toAddress}) {
    showFullScreenDialog(
        context: context,
        child: TransferTokenWidget(
          param: TransferTokenWidgetParam(
              account: accountPublicInfo,
              tokenAvailable: digBalance,
              toAddress: toAddress),
        ));
  }
}

class HomeAppBar extends StatelessWidget {
  final Function? onScanQrTap;

  const HomeAppBar({this.onScanQrTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
              child: Row(
            children: [
              const SizedBox(
                width: 32,
              ),
              GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(
                  Icons.menu,
                  color: DSColors.tulipTree,
                ),
              ),
              const Expanded(child: SizedBox.shrink()),
              const Icon(
                Icons.notifications,
                color: DSColors.tulipTree,
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onScanQrTap?.call(),
                child: Image.asset(
                  AppAssets.icScanQr,
                  width: 18,
                  height: 18,
                ),
              ),
              const SizedBox(
                width: 32,
              ),
            ],
          )),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppAssets.icDigLogo,
              width: 37,
              height: 27,
            ),
          )
        ],
      ),
    );
  }
}
