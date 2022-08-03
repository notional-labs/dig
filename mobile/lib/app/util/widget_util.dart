import 'package:dig_mobile_app/app/definition/string.dart';
import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_small_button.dart';
import 'package:dig_mobile_app/app/designsystem/ds_snack_bar.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/page/pin/pin_page.dart';
import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

OverlaySupportEntry? _loadingOverlayEntry;
OverlaySupportEntry? _pinOverlayEntry;
DSSnackBar? _snackBar;
bool _isPinOverlayShowing = false;

mixin WidgetUtil {
  void showGlobalLoadingOverlay() {
    dismissGlobalLoadingOverlay();
    _loadingOverlayEntry = showOverlay(
        (_, __) => Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.3),
            child: const Center(
              child: CircularProgressIndicator(),
            )),
        duration: const Duration(hours: 100));
  }

  void dismissGlobalLoadingOverlay() {
    _loadingOverlayEntry?.dismiss(animate: false);
  }

  void closeGlobalKeyboard() {
    FocusScope.of(navigatorKey.currentContext!).requestFocus(FocusNode());
  }

  bool checkLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  bool checkKeyboardOpening(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom != 0;

  void showGlobalDSSnackBar(
      {required String message, DSSnackBarType type = DSSnackBarType.success}) {
    _snackBar = DSSnackBar(message: message, type: type);
    _snackBar!.show();
  }

  void dismissGlobalSnackBar() {
    _snackBar?.dismiss(true);
  }

  void showEnterPINOverlay() {
    if (_isPinOverlayShowing ||
        DigRoute.currentPage == DigPageName.pin ||
        DigRoute.currentPage == DigPageName.splash) {
      return;
    }

    _isPinOverlayShowing = true;
    _pinOverlayEntry = showOverlay(
        (_, __) => Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.red,
            child: const PinPage(
              type: PinPageType.authAfterAppPaused,
            )),
        duration: const Duration(hours: 10000));
  }

  void dismissPINOverlay() {
    _pinOverlayEntry?.dismiss(animate: false);
    _isPinOverlayShowing = false;
  }

  bool canPop(BuildContext context) => Navigator.of(context).canPop();

  Future<dynamic> showCenterDialog(
      {required BuildContext context, required Widget child}) {
    return showDialog(
        context: context,
        builder: (_) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child,
              ],
            ),
        useRootNavigator: true);
  }

  Future<dynamic> showFullScreenDialog(
      {required BuildContext context, required Widget child}) {
    return showDialog(
        context: context, builder: (_) => child, useRootNavigator: true);
  }

  Future<dynamic> showActionDialog(
          {required BuildContext context,
          required String title,
          required String message,
          required String leftActTitle,
          required String rightActTitle,
          required VoidCallback onLeftTap,
          required VoidCallback onRightTap}) =>
      showCenterDialog(
          context: context,
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                color: DSColors.tundora,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: DSTextStyle.tsMontserratT20B
                        .copyWith(color: DSColors.tulipTree),
                  ),
                  const SizedBox(height: 10),
                  Text(message,
                      textAlign: TextAlign.center,
                      style: DSTextStyle.tsMontserratT12R
                          .copyWith(color: Colors.white)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DSSmallButton(
                        title: leftActTitle,
                        onTap: () {
                          onLeftTap();
                        },
                        backgroundColor: DSColors.silver2,
                      ),
                      DSSmallButton(
                        title: rightActTitle,
                        onTap: () {
                          onRightTap();
                        },
                        backgroundColor: DSColors.tulipTree,
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
}
