import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/page/active_account/active_account_detail/active_account_detail_page.dart';
import 'package:dig_mobile_app/app/page/confirm_pin/confirm_pin_page.dart';
import 'package:dig_mobile_app/app/page/create_wallet_flow/backup_your_wallet/backup_your_wallet_page.dart';
import 'package:dig_mobile_app/app/page/create_wallet_flow/confirm_recovery_phrase/confirm_recovery_phrase.dart';
import 'package:dig_mobile_app/app/page/create_wallet_flow/recovery_phrase/recovery_phrase_page.dart';
import 'package:dig_mobile_app/app/page/home/home_page.dart';
import 'package:dig_mobile_app/app/page/import_account/import_account_page.dart';
import 'package:dig_mobile_app/app/page/name_account/name_account_page.dart';
import 'package:dig_mobile_app/app/page/pin/pin_page.dart';
import 'package:dig_mobile_app/app/page/proposals_flow/proposal_detail/proposal_detail_page.dart';
import 'package:dig_mobile_app/app/page/scan_qr_code/scan_qr_code_page.dart';
import 'package:dig_mobile_app/app/page/sign_in/sign_in_page.dart';
import 'package:dig_mobile_app/app/page/splash/splash.dart';
import 'package:dig_mobile_app/app/page/staking/staking_page.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class DigRoute {
  static String currentPage = DigPageName.root;
  PageRoute generateRoute(RouteSettings settings) {
    final name = settings.name;
    // ignore: unused_local_variable
    final args = settings.arguments;
    currentPage = name ?? DigPageName.root;

    switch (name) {
      case DigPageName.root:
      case DigPageName.splash:
        return _materialPage(const SplashPage(), settings);
      case DigPageName.signIn:
        return _materialPage(const LoginPage(), settings);
      case DigPageName.home:
        // final account = args as AccountPublicInfo?;
        return _materialPage(const HomePage(), settings);
      case DigPageName.backUpYourWallet:
        return _materialPage(const BackUpYourWalletPage(), settings);
      case DigPageName.recoveryPhrase:
        final mnemonic = (args as String?) ?? '';
        return _materialPage(RecoveryPhrasePage(mnemonic: mnemonic), settings);
      case DigPageName.confirmRecoveryPhrase:
        final mnemonic = (args as String?) ?? '';
        return _materialPage(
            ConfirmRecoveryPhrase(mnemonic: mnemonic), settings);
      case DigPageName.importAccount:
        return _materialPage(const ImportAccountPage(), settings);
      case DigPageName.nameAccount:
        final String mnemonic = (args as String?) ?? '';
        return _materialPage(
            NameAccountPage(
              param: NameAccountPageParam(mnemonic: mnemonic),
            ),
            settings);
      case DigPageName.pin:
        final type = (args as PinPageType?) ?? PinPageType.create;
        return _materialPage(PinPage(type: type), settings);
      case DigPageName.confirmPin:
        final param = (args as ConfirmPinPageParam?) ??
            const ConfirmPinPageParam(pin: '');
        return _materialPage(ConfirmPinPage(param: param), settings);
      case DigPageName.proposalDetail:
        final params = args as ProposalDetailPageParams?;
        return _materialPage(
            ProposalDetailPage(
              params: params,
            ),
            settings);
      case DigPageName.staking:
        return _materialPage(const StakingPage(), settings);
      case DigPageName.scanQrCode:
        return _materialPage(const ScanQrCodePage(), settings);
      case DigPageName.activeAccountDetail:
        return _materialPage(const ActiveAccountDetailPage(), settings);
      default:
        return _materialPage(const SizedBox.shrink(), settings);
    }
  }

  MaterialPageRoute _materialPage(Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }
}
