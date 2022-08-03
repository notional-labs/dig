import 'package:dartz/dartz.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/cubit/home/home_state.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/page/home/home_drawer.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      this._getSelectedAccountUseCase,
      this._getListAccountUseCase,
      this._selectAccountUseCase,
      this._removeAccountUseCase,
      this._deletePinUseCase,
      this._getListBalanceUseCase)
      : super(const HomeInitialSate());

  final GetSelectedAccountUseCase _getSelectedAccountUseCase;
  final GetListAccountUseCase _getListAccountUseCase;
  final SelectAccountUseCase _selectAccountUseCase;
  final RemoveAccountUseCase _removeAccountUseCase;
  final DeletePinUseCase _deletePinUseCase;
  final GetListBalanceUseCase _getListBalanceUseCase;

  Future init() async {
    AccountPublicInfo? account;
    List<AccountPublicInfo> accounts = const [];
    final getSelectedAccountUseCaseResult = await _getSelectedAccountUseCase
        .call(const GetSelectedAccountUseCaseParam());
    final getListAccountUseCaseResult =
        await _getListAccountUseCase.call(const GetListAccountUseCaseParam());

    if (getSelectedAccountUseCaseResult.isRight()) {
      getSelectedAccountUseCaseResult.foldRight(null, (r, _) {
        account = r;
      });
    }

    if (getListAccountUseCaseResult.isRight()) {
      getListAccountUseCaseResult.foldRight(const [], (r, _) {
        accounts = r;
      });
    }

    final viewModel =
        state.viewModel.copyWith(account: account, accounts: accounts);

    if (accounts.isNotEmpty && account != null) {
      emit(HomePrimaryState(viewModel: viewModel));

      emit(HomeLoadingState(viewModel: state.viewModel));

      final getListBalanceUseCaseResult = await _getListBalanceUseCase.call(
          GetListBalanceUseCaseParam(
              request: BalanceRequest(address: account?.publicAddress ?? '')));

      getListBalanceUseCaseResult.fold((exception) {
        emit(HomeErrorState(
            viewModel: state.viewModel.copyWith(), exception: exception));
      }, (balances) {
        emit(HomePrimaryState(
            viewModel: state.viewModel.copyWith(balances: balances)));
      });

      return;
    }

    emit(HomeErrorState(
        viewModel: state.viewModel.copyWith(),
        exception: DigException(message: S.current.some_thing_wrong)));
  }

  Future changeAccount(AccountPublicInfo account) async {
    await _selectAccountUseCase
        .call(SelectAccountUseCaseParam(accountPublicInfo: account));
    emit(HomeChangedAccountState(
        viewModel: state.viewModel
            .copyWith(account: account, currentHomePage: DrawerMenu.account)));
    emit(HomePrimaryState(viewModel: state.viewModel.copyWith()));
  }

  void changeHomePage(DrawerMenu drawerMenu) {
    navigatorKey.currentState!.pop();
    if (drawerMenu == state.viewModel.currentDrawerMenu) {
      return;
    }
    emit(HomePrimaryState(
        viewModel: state.viewModel.copyWith(currentHomePage: drawerMenu)));
  }

  Future removeAccount(AccountPublicInfo accountPublicInfo) async {
    final result = await _removeAccountUseCase
        .call(RemoveAccountUseCaseParam(accountPublicInfo: accountPublicInfo));

    if (result.isRight()) {
      final getListAccountUseCaseResult =
          await _getListAccountUseCase.call(const GetListAccountUseCaseParam());

      if (getListAccountUseCaseResult.isRight()) {
        List<AccountPublicInfo> accounts = const [];
        getListAccountUseCaseResult.foldRight(const [], (r, _) {
          accounts = r;
        });
        await _selectAccountUseCase
            .call(SelectAccountUseCaseParam(accountPublicInfo: accounts.first));
        init();
        return;
      }

      await _deletePinUseCase.call(const None());
      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(DigPageName.signIn, (route) => false);

      return;
    }

    emit(HomeErrorState(
        viewModel: state.viewModel.copyWith(),
        exception: DigException(message: S.current.some_thing_wrong)));
  }

  void goToSignInPage() =>
      navigatorKey.currentState?.pushNamed(DigPageName.signIn);

  Future onScanQrCodeTap() async {
    final barCode = (await navigatorKey.currentState
        ?.pushNamed(DigPageName.scanQrCode)) as Barcode?;
    if (barCode != null && (barCode.code?.isNotEmpty ?? true)) {
      // todo check valid address later
      emit(HomeScannerBarcodeState(
          barCode: barCode.code ?? '', viewModel: state.viewModel));
      emit(HomePrimaryState(viewModel: state.viewModel));
    }
  }
}
