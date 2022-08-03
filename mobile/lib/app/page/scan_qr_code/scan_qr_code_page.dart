import 'package:dig_mobile_app/app/designsystem/ds_background.dart';
import 'package:dig_mobile_app/app/designsystem/ds_primary_appbar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_scan_qr_code.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:dig_mobile_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanQrCodePage extends StatefulWidget {
  const ScanQrCodePage({Key? key}) : super(key: key);

  @override
  State<ScanQrCodePage> createState() => _ScanQrCodePageState();
}

class _ScanQrCodePageState extends State<ScanQrCodePage> {
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
                  title: S.current.scan_qr_code_page_title,
                  onBackButtonPressed: () => navigatorKey.currentState?.pop(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(child: DSScanQrCode(
                  onQRCodeDetected: (barCode) {
                    navigatorKey.currentState?.pop(barCode);
                  },
                ))
              ],
            ),
          ),
        )));
  }
}
