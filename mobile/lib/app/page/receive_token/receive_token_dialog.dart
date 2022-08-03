import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_qr_code_image.dart';
import 'package:dig_mobile_app/app/designsystem/custom/ds_wallet_address.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_secondary_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class ReceiveTokenDialog extends StatelessWidget {
  final String address;
  final Function(String)? onCopyToClipboardTap;
  final Function(String)? onShareAddressTap;
  final Function()? onScanQrCodeTap;

  const ReceiveTokenDialog(
      {required this.address,
      this.onCopyToClipboardTap,
      this.onShareAddressTap,
      this.onScanQrCodeTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: DSColors.tundora,
      ),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              S.current.scan_qr_code,
              style: DSTextStyle.tsMontserratT20B
                  .copyWith(color: DSColors.tulipTree),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 42),
              child: DSWalletAddress(
                address: address,
                onCopyToClipboardTap: (address) =>
                    onCopyToClipboardTap?.call(address),
              )),
          const SizedBox(
            height: 20,
          ),
          DSQrCodeImage(
            data: address,
          ),
          const SizedBox(
            height: 20,
          ),
          DSSecondaryButton(
            title: S.current.share_address,
            onTap: () => onShareAddressTap?.call(address),
          ),
          const SizedBox(
            height: 18,
          ),
          _scanButton(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _scanButton() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onScanQrCodeTap?.call(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.icScanQr,
            width: 18,
            height: 18,
            color: Colors.white,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            S.current.scan,
            style: DSTextStyle.tsMontserratT12R.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
