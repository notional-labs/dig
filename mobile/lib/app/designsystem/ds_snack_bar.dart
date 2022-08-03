import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:dig_mobile_app/app/designsystem/ds_window_area_fitted_box.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

enum DSSnackBarType {
  success,
  error,
}

class DSSnackBar {
  final Key? key;
  final String _message;
  final Duration _duration;
  final VoidCallback _onDismissed;
  final bool _slideDismiss;
  final DSSnackBarType _type;
  OverlaySupportEntry? _overlayEntry;
  bool _isShowing = false;

  bool get isShowing => _isShowing;

  DSSnackBar._(this.key, this._message, this._duration, this._onDismissed,
      this._slideDismiss, this._type);

  factory DSSnackBar(
          {Key? key,
          Widget? icon,
          String? message,
          Duration? duration,
          VoidCallback? onDismissed,
          bool? slideDismiss,
          DSSnackBarType type = DSSnackBarType.success}) =>
      DSSnackBar._(key, message ?? '', duration ?? const Duration(seconds: 2),
          onDismissed ?? () {}, slideDismiss ?? true, type);

  final Map<DSSnackBarType, Color> _colors = {
    DSSnackBarType.success: Colors.green,
    DSSnackBarType.error: Colors.red,
  };

  void show() {
    if (!_isShowing) {
      _isShowing = true;
      _overlayEntry = _showSnackBar()
        ..dismissed.then((_) {
          _isShowing = false;
          _onDismissed();
        });
    }
  }

  void dismiss([bool animate = false]) {
    if (_isShowing) {
      _overlayEntry?.dismiss(animate: animate);
    }
  }

  OverlaySupportEntry _showSnackBar() => showOverlayNotification(
      (context) => _slideDismiss
          ? _dismissible(
              key: const ValueKey(null),
              direction: DismissDirection.up,
              child: _body)
          : _body,
      duration: _duration,
      key: key);

  Widget get _body => Container(
        color: _colors[_type],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DSWindowAreaFittedBox(fitTop: true, color: _colors[_type]),
            Material(
              color: _colors[_type],
              child: Container(
                  constraints: const BoxConstraints(minHeight: 48),
                  color: _colors[_type],
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 12, bottom: 12),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _message,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: DSTextStyle.tsMontserratT14R.copyWith(
                              letterSpacing: 0.4, color: Colors.white),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      );

  Widget _dismissible({
    required Key key,
    required DismissDirection direction,
    required Widget child,
  }) =>
      Dismissible(
        key: key,
        direction: direction,
        onDismissed: (direction) {
          dismiss();
        },
        child: child,
      );
}
