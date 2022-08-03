import 'package:bloc/bloc.dart';
import 'package:dig_core/dig_core.dart';
import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/app/viewmodel/active_account_viewmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:share_plus/share_plus.dart';

part 'active_account_state.dart';

@Injectable()
class ActiveAccountCubit extends Cubit<ActiveAccountState> {
  final GetListBalanceUseCase _getListBalanceUseCase;

  ActiveAccountCubit(this._getListBalanceUseCase)
      : super(const ActiveAccountInitialState());

  void init(List<Balance> balances) {
    emit(ActiveAccountPrimaryState(
        viewModel: state.viewModel.copyWith(balances: balances)));
  }

  Future fetchData(
      {required AccountPublicInfo account, bool isRefresh = false}) async {
    emit(ActiveAccountLoadingState(
        viewModel: state.viewModel.copyWith(), isRefresh: isRefresh));

    final result = await _getListBalanceUseCase.call(GetListBalanceUseCaseParam(
        request: BalanceRequest(address: account.publicAddress)));
    result.fold((l) {
      emit(ActiveAccountErrorState(
          viewModel: state.viewModel.copyWith(), exception: l));
    }, (r) {
      emit(ActiveAccountPrimaryState(
          viewModel: state.viewModel.copyWith(balances: r)));
    });
  }

  void resetData() {
    emit(const ActiveAccountPrimaryState(viewModel: ActiveAccountViewModel()));
  }

  Future refreshEvent(AccountPublicInfo account) =>
      fetchData(account: account, isRefresh: true);

  void copyAddressToClipboard(String address) {
    Clipboard.setData(ClipboardData(text: address));
  }

  void onSelectTab(int index) {
    emit(ActiveAccountPrimaryState(
        viewModel: state.viewModel.copyWith(selectedTab: index)));
  }

  void onShareAddress(String content) {
    if (content.trim().isEmpty) {
      return;
    }
    Share.share(content).catchError(_handleShareAddressFailure);
  }

  Future onScanQrCodeTap() async {
    navigatorKey.currentState?.pop();
    final barCode = (await navigatorKey.currentState
        ?.pushNamed(DigPageName.scanQrCode)) as Barcode?;
    if (barCode != null && (barCode.code?.isNotEmpty ?? true)) {
      // todo check valid address later
      emit(ActiveAccountScannedBarcodeState(
          barCode: barCode.code ?? '', viewModel: state.viewModel));
      emit(ActiveAccountPrimaryState(viewModel: state.viewModel));
    }
  }

  void _handleShareAddressFailure(exception) {
    emit(ActiveAccountErrorState(
        viewModel: state.viewModel.copyWith(),
        exception: DigException(message: exception)));
  }
}
