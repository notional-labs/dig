import 'package:dig_mobile_app/app/cubit/backup_your_wallet/backup_your_wallet_cubit.dart';
import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_plain_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/di/di.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackUpYourWalletPage extends StatefulWidget {
  const BackUpYourWalletPage({Key? key}) : super(key: key);

  @override
  State<BackUpYourWalletPage> createState() => _BackUpYourWalletPageState();
}

class _BackUpYourWalletPageState extends State<BackUpYourWalletPage> {
  final BackupYourWalletCubit _cubit = di();

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
                onBackButtonPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(height: 38),
              Expanded(child: SingleChildScrollView(child: _buildBody()))
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.back_up_your_wallet,
            style: DSTextStyle.tsMontserratT20B
                .copyWith(color: DSColors.tulipTree),
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            S.current.back_up_your_wallet_description,
            style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 34,
          ),
          _ReminderBox(text: S.current.back_up_your_wallet_reminder_1),
          const SizedBox(
            height: 25,
          ),
          _ReminderBox(text: S.current.back_up_your_wallet_reminder_2),
          const SizedBox(
            height: 25,
          ),
          _ReminderBox(text: S.current.back_up_your_wallet_reminder_3),
          const SizedBox(
            height: 40,
          ),
          DSPrimaryButton(
              title: S.current.back_up_now,
              onTap: () => _cubit.onBackUpNowTap()),
          const SizedBox(
            height: 16,
          ),
          DSPlainButton(title: S.current.back_up_later, onTap: () {}),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class _ReminderBox extends StatelessWidget {
  final String text;

  const _ReminderBox({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 23),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0, right: 6),
            child: Container(
              width: 5,
              height: 5,
              decoration: const BoxDecoration(
                  color: DSColors.tulipTree, shape: BoxShape.circle),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
