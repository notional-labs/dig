abstract class DigPageName {
  static const String root = '/';
  static const String splash = '/splash';
  static const String signIn = '/sign_in';
  static const String home = '/home';
  static const String backUpYourWallet = '/back_up_your_wallet';
  static const String importAccount = '/import_account';
  static const String recoveryPhrase = '/recovery_phrase';
  static const String confirmRecoveryPhrase = '/confirm_recovery_phrase';
  static const String nameAccount = '/name_account';
  static const String pin = '/pin';
  static const String confirmPin = '/confirm_pin';
  static const String proposalDetail = '/proposal_detail';
  static const String staking = '/staking';
  static const String scanQrCode = '/scan_qr_code';
  static const String activeAccountDetail = '/active_account_detail';
}

abstract class Denom {
  static const String udig = 'udig';
}

abstract class TokenBalanceRatio {
  static const double ratio = 1000000;
}

abstract class Fee {
  static const double defaultFee = 42949673;
  static double defaultFeeDisplay = defaultFee / TokenBalanceRatio.ratio;
}

abstract class Chain {
  static const String digChain = 'dig-chain';
}

abstract class Currency {
  static const String usd = 'usd';
}
