// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ig CHAIN`
  String get ig_chain {
    return Intl.message(
      'ig CHAIN',
      name: 'ig_chain',
      desc: '',
      args: [],
    );
  }

  /// `into the mine`
  String get into_the_mine {
    return Intl.message(
      'into the mine',
      name: 'into_the_mine',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Exchange`
  String get exchange {
    return Intl.message(
      'Exchange',
      name: 'exchange',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `ig`
  String get ig {
    return Intl.message(
      'ig',
      name: 'ig',
      desc: '',
      args: [],
    );
  }

  /// `WELCOME`
  String get welcome {
    return Intl.message(
      'WELCOME',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Sign in on your account`
  String get sign_in_on_your_account {
    return Intl.message(
      'Sign in on your account',
      name: 'sign_in_on_your_account',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Or sign in with`
  String get or_sign_in_with {
    return Intl.message(
      'Or sign in with',
      name: 'or_sign_in_with',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have account? Create`
  String get dont_have_account_create {
    return Intl.message(
      'Don’t have account? Create',
      name: 'dont_have_account_create',
      desc: '',
      args: [],
    );
  }

  /// `Copyright © {year} Digchain.`
  String copyright_digchain(Object year) {
    return Intl.message(
      'Copyright © $year Digchain.',
      name: 'copyright_digchain',
      desc: '',
      args: [year],
    );
  }

  /// `Forgot you Password ?`
  String get forgot_you_password {
    return Intl.message(
      'Forgot you Password ?',
      name: 'forgot_you_password',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Email`
  String get sign_up_form_hint_invalid_email {
    return Intl.message(
      'Invalid Email',
      name: 'sign_up_form_hint_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Token`
  String get token {
    return Intl.message(
      'Token',
      name: 'token',
      desc: '',
      args: [],
    );
  }

  /// `Real estate`
  String get real_estate {
    return Intl.message(
      'Real estate',
      name: 'real_estate',
      desc: '',
      args: [],
    );
  }

  /// `Back up your wallet`
  String get back_up_your_wallet {
    return Intl.message(
      'Back up your wallet',
      name: 'back_up_your_wallet',
      desc: '',
      args: [],
    );
  }

  /// `If your device is lost or stolen, you will be able to recover your account.`
  String get back_up_your_wallet_description {
    return Intl.message(
      'If your device is lost or stolen, you will be able to recover your account.',
      name: 'back_up_your_wallet_description',
      desc: '',
      args: [],
    );
  }

  /// `We will never ask you to share your recovery phrase`
  String get back_up_your_wallet_reminder_1 {
    return Intl.message(
      'We will never ask you to share your recovery phrase',
      name: 'back_up_your_wallet_reminder_1',
      desc: '',
      args: [],
    );
  }

  /// `Never share your recovery phrase with anyone, store it securely`
  String get back_up_your_wallet_reminder_2 {
    return Intl.message(
      'Never share your recovery phrase with anyone, store it securely',
      name: 'back_up_your_wallet_reminder_2',
      desc: '',
      args: [],
    );
  }

  /// `If you don’t backup your wallet or lose your recovery phrase, you will not able to recover your account`
  String get back_up_your_wallet_reminder_3 {
    return Intl.message(
      'If you don’t backup your wallet or lose your recovery phrase, you will not able to recover your account',
      name: 'back_up_your_wallet_reminder_3',
      desc: '',
      args: [],
    );
  }

  /// `Back up now`
  String get back_up_now {
    return Intl.message(
      'Back up now',
      name: 'back_up_now',
      desc: '',
      args: [],
    );
  }

  /// `Back up later`
  String get back_up_later {
    return Intl.message(
      'Back up later',
      name: 'back_up_later',
      desc: '',
      args: [],
    );
  }

  /// `To Digchain`
  String get to_digchain {
    return Intl.message(
      'To Digchain',
      name: 'to_digchain',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get create_account {
    return Intl.message(
      'Create account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Import account`
  String get import_account {
    return Intl.message(
      'Import account',
      name: 'import_account',
      desc: '',
      args: [],
    );
  }

  /// `Your recovery phrase`
  String get your_recovery_phrase {
    return Intl.message(
      'Your recovery phrase',
      name: 'your_recovery_phrase',
      desc: '',
      args: [],
    );
  }

  /// `Please write down your 12 words in safe space manually on paper.`
  String get your_recovery_phrase_description {
    return Intl.message(
      'Please write down your 12 words in safe space manually on paper.',
      name: 'your_recovery_phrase_description',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_text {
    return Intl.message(
      'Continue',
      name: 'continue_text',
      desc: '',
      args: [],
    );
  }

  /// `Copy to clipboard`
  String get copy_to_clipboard {
    return Intl.message(
      'Copy to clipboard',
      name: 'copy_to_clipboard',
      desc: '',
      args: [],
    );
  }

  /// `Copied to clipboard`
  String get copied_to_clipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'copied_to_clipboard',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advanced {
    return Intl.message(
      'Advanced',
      name: 'advanced',
      desc: '',
      args: [],
    );
  }

  /// `Enter your recovery phrase`
  String get enter_your_recovery_phrase {
    return Intl.message(
      'Enter your recovery phrase',
      name: 'enter_your_recovery_phrase',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get import {
    return Intl.message(
      'Import',
      name: 'import',
      desc: '',
      args: [],
    );
  }

  /// `Name account`
  String get name_account {
    return Intl.message(
      'Name account',
      name: 'name_account',
      desc: '',
      args: [],
    );
  }

  /// `I have backed up my recovery phrase, I understand that if I lose my recovery phrase, I will lose my fund`
  String get confirm_backup_recovery_phrase {
    return Intl.message(
      'I have backed up my recovery phrase, I understand that if I lose my recovery phrase, I will lose my fund',
      name: 'confirm_backup_recovery_phrase',
      desc: '',
      args: [],
    );
  }

  /// `Confirm recovery phrase`
  String get confirm_recovery_phrase {
    return Intl.message(
      'Confirm recovery phrase',
      name: 'confirm_recovery_phrase',
      desc: '',
      args: [],
    );
  }

  /// `Enter your passcode`
  String get enter_your_passcode {
    return Intl.message(
      'Enter your passcode',
      name: 'enter_your_passcode',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your passcode`
  String get confirm_your_passcode {
    return Intl.message(
      'Confirm your passcode',
      name: 'confirm_your_passcode',
      desc: '',
      args: [],
    );
  }

  /// `Passcode do not match`
  String get passcode_do_not_match {
    return Intl.message(
      'Passcode do not match',
      name: 'passcode_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `No account found`
  String get no_account_found {
    return Intl.message(
      'No account found',
      name: 'no_account_found',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get proposal_detail_page_title {
    return Intl.message(
      'Detail',
      name: 'proposal_detail_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Proposal ID`
  String get proposal_id {
    return Intl.message(
      'Proposal ID',
      name: 'proposal_id',
      desc: '',
      args: [],
    );
  }

  /// `Proposer`
  String get proposer {
    return Intl.message(
      'Proposer',
      name: 'proposer',
      desc: '',
      args: [],
    );
  }

  /// `Total Deposit`
  String get total_deposit {
    return Intl.message(
      'Total Deposit',
      name: 'total_deposit',
      desc: '',
      args: [],
    );
  }

  /// `Submitted Time`
  String get submitted_time {
    return Intl.message(
      'Submitted Time',
      name: 'submitted_time',
      desc: '',
      args: [],
    );
  }

  /// `Voting Time`
  String get voting_time {
    return Intl.message(
      'Voting Time',
      name: 'voting_time',
      desc: '',
      args: [],
    );
  }

  /// `Proposal Type`
  String get proposal_type {
    return Intl.message(
      'Proposal Type',
      name: 'proposal_type',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Remove Account`
  String get remove_account {
    return Intl.message(
      'Remove Account',
      name: 'remove_account',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove this Account?`
  String get are_you_sure_you_want_to_remove_this_account {
    return Intl.message(
      'Are you sure you want to remove this Account?',
      name: 'are_you_sure_you_want_to_remove_this_account',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove {
    return Intl.message(
      'Remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `Some thing wrong`
  String get some_thing_wrong {
    return Intl.message(
      'Some thing wrong',
      name: 'some_thing_wrong',
      desc: '',
      args: [],
    );
  }

  /// `${money}`
  String usd_money_format(Object money) {
    return Intl.message(
      '\$$money',
      name: 'usd_money_format',
      desc: '',
      args: [money],
    );
  }

  /// `{token} DIG`
  String dig_token_format(Object token) {
    return Intl.message(
      '$token DIG',
      name: 'dig_token_format',
      desc: '',
      args: [token],
    );
  }

  /// `proposals`
  String get proposals {
    return Intl.message(
      'proposals',
      name: 'proposals',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get proposals_item_detail_text {
    return Intl.message(
      'Detail',
      name: 'proposals_item_detail_text',
      desc: '',
      args: [],
    );
  }

  /// `Deposit`
  String get proposal_status_deposit {
    return Intl.message(
      'Deposit',
      name: 'proposal_status_deposit',
      desc: '',
      args: [],
    );
  }

  /// `Voting`
  String get proposal_status_voting {
    return Intl.message(
      'Voting',
      name: 'proposal_status_voting',
      desc: '',
      args: [],
    );
  }

  /// `Passed`
  String get proposal_status_passed {
    return Intl.message(
      'Passed',
      name: 'proposal_status_passed',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get proposal_status_rejected {
    return Intl.message(
      'Rejected',
      name: 'proposal_status_rejected',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get proposal_status_failed {
    return Intl.message(
      'Failed',
      name: 'proposal_status_failed',
      desc: '',
      args: [],
    );
  }

  /// `Unrecognized`
  String get proposal_status_unrecognized {
    return Intl.message(
      'Unrecognized',
      name: 'proposal_status_unrecognized',
      desc: '',
      args: [],
    );
  }

  /// `Submit Date`
  String get submit_date {
    return Intl.message(
      'Submit Date',
      name: 'submit_date',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get start_date {
    return Intl.message(
      'Start Date',
      name: 'start_date',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get end_date {
    return Intl.message(
      'End Date',
      name: 'end_date',
      desc: '',
      args: [],
    );
  }

  /// `STAKING`
  String get staking {
    return Intl.message(
      'STAKING',
      name: 'staking',
      desc: '',
      args: [],
    );
  }

  /// `ACCOUNT`
  String get account {
    return Intl.message(
      'ACCOUNT',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `vote`
  String get vote {
    return Intl.message(
      'vote',
      name: 'vote',
      desc: '',
      args: [],
    );
  }

  /// `Receive`
  String get receive {
    return Intl.message(
      'Receive',
      name: 'receive',
      desc: '',
      args: [],
    );
  }

  /// `Scan QR code`
  String get scan_qr_code {
    return Intl.message(
      'Scan QR code',
      name: 'scan_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Share Address`
  String get share_address {
    return Intl.message(
      'Share Address',
      name: 'share_address',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get scan {
    return Intl.message(
      'Scan',
      name: 'scan',
      desc: '',
      args: [],
    );
  }

  /// `Transfer Token`
  String get transfer_token {
    return Intl.message(
      'Transfer Token',
      name: 'transfer_token',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Amount Available`
  String get amount_available {
    return Intl.message(
      'Amount Available',
      name: 'amount_available',
      desc: '',
      args: [],
    );
  }

  /// `Amount To Send`
  String get amount_to_send {
    return Intl.message(
      'Amount To Send',
      name: 'amount_to_send',
      desc: '',
      args: [],
    );
  }

  /// `Advance`
  String get advance {
    return Intl.message(
      'Advance',
      name: 'advance',
      desc: '',
      args: [],
    );
  }

  /// `Set Gas`
  String get set_gas {
    return Intl.message(
      'Set Gas',
      name: 'set_gas',
      desc: '',
      args: [],
    );
  }

  /// `Recipient address`
  String get recipient_address {
    return Intl.message(
      'Recipient address',
      name: 'recipient_address',
      desc: '',
      args: [],
    );
  }

  /// `Input a number`
  String get input_a_number {
    return Intl.message(
      'Input a number',
      name: 'input_a_number',
      desc: '',
      args: [],
    );
  }

  /// `Not enough token`
  String get not_enough_token {
    return Intl.message(
      'Not enough token',
      name: 'not_enough_token',
      desc: '',
      args: [],
    );
  }

  /// `Scan QR code`
  String get scan_qr_code_page_title {
    return Intl.message(
      'Scan QR code',
      name: 'scan_qr_code_page_title',
      desc: '',
      args: [],
    );
  }

  /// `Delegate Token`
  String get delegate_token {
    return Intl.message(
      'Delegate Token',
      name: 'delegate_token',
      desc: '',
      args: [],
    );
  }

  /// `Validator`
  String get validator {
    return Intl.message(
      'Validator',
      name: 'validator',
      desc: '',
      args: [],
    );
  }

  /// `Delegator`
  String get delegator {
    return Intl.message(
      'Delegator',
      name: 'delegator',
      desc: '',
      args: [],
    );
  }

  /// `Amount To Stake`
  String get amount_to_stack {
    return Intl.message(
      'Amount To Stake',
      name: 'amount_to_stack',
      desc: '',
      args: [],
    );
  }

  /// `{n}%`
  String n_percent(Object n) {
    return Intl.message(
      '$n%',
      name: 'n_percent',
      desc: '',
      args: [n],
    );
  }

  /// `Token sent`
  String get token_sent {
    return Intl.message(
      'Token sent',
      name: 'token_sent',
      desc: '',
      args: [],
    );
  }

  /// `Minimum`
  String get minimum {
    return Intl.message(
      'Minimum',
      name: 'minimum',
      desc: '',
      args: [],
    );
  }

  /// `Create Proposal`
  String get create_proposal {
    return Intl.message(
      'Create Proposal',
      name: 'create_proposal',
      desc: '',
      args: [],
    );
  }

  /// `Initial Deposit`
  String get initial_deposit {
    return Intl.message(
      'Initial Deposit',
      name: 'initial_deposit',
      desc: '',
      args: [],
    );
  }

  /// `Minimal Deposit`
  String get minimal_deposit {
    return Intl.message(
      'Minimal Deposit',
      name: 'minimal_deposit',
      desc: '',
      args: [],
    );
  }

  /// `Gas default`
  String get gas_default {
    return Intl.message(
      'Gas default',
      name: 'gas_default',
      desc: '',
      args: [],
    );
  }

  /// `DIG CHAIN`
  String get dig_chain {
    return Intl.message(
      'DIG CHAIN',
      name: 'dig_chain',
      desc: '',
      args: [],
    );
  }

  /// `{n} USD`
  String usd_format(Object n) {
    return Intl.message(
      '$n USD',
      name: 'usd_format',
      desc: '',
      args: [n],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
