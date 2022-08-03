import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';

enum DSRoundedButtonActionType { receive, buy, send, exchange, remove, none }

class DSRoundedButton extends StatelessWidget {
  final DSRoundedButtonActionType actionType;
  final String? text;
  final String? icon;
  final VoidCallback? onTap;

  const DSRoundedButton(
      {this.actionType = DSRoundedButtonActionType.none,
      this.text,
      this.icon,
      this.onTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Column(
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: const BoxDecoration(
                color: DSColors.tulipTree, shape: BoxShape.circle),
            child: Image.asset(icon ?? _getIconByType()),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            text ?? _getTextByType(),
            style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }

  String _getIconByType() {
    switch (actionType) {
      case DSRoundedButtonActionType.receive:
        return AppAssets.icSolidCoins;
      case DSRoundedButtonActionType.buy:
        return AppAssets.icSolidCoins;
      case DSRoundedButtonActionType.send:
        return AppAssets.icArrowUpRight;
      case DSRoundedButtonActionType.exchange:
        return AppAssets.icArrowExchange;
      case DSRoundedButtonActionType.remove:
        return AppAssets.icDelete;
      case DSRoundedButtonActionType.none:
        return '';
    }
  }

  String _getTextByType() {
    switch (actionType) {
      case DSRoundedButtonActionType.receive:
        return S.current.receive;
      case DSRoundedButtonActionType.buy:
        return S.current.buy;
      case DSRoundedButtonActionType.send:
        return S.current.send;
      case DSRoundedButtonActionType.exchange:
        return S.current.exchange;
      case DSRoundedButtonActionType.remove:
        return S.current.remove;
      case DSRoundedButtonActionType.none:
        return '';
    }
  }
}
