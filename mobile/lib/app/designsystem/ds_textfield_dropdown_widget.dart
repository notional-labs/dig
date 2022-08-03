import 'package:dig_mobile_app/app/designsystem/ds_text_field.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class DSTextFieldDropdownController extends ChangeNotifier {
  bool overlayState = false;

  void close() {
    overlayState = false;
    notifyListeners();
  }
}

class DSTextFieldDropdownWidget extends StatefulWidget {
  final Widget child;
  final String hintText;
  final TextEditingController? textController;
  final DSTextFieldDropdownController? controller;
  final double? height;
  final EdgeInsets? contentPadding;

  const DSTextFieldDropdownWidget(
      {required this.child,
      this.textController,
      this.controller,
      this.hintText = '',
      this.height,
      this.contentPadding,
      Key? key})
      : super(key: key);

  @override
  State<DSTextFieldDropdownWidget> createState() =>
      _DSTextFieldDropdownWidgetState();
}

class _DSTextFieldDropdownWidgetState extends State<DSTextFieldDropdownWidget> {
  DSTextFieldDropdownController _controller = DSTextFieldDropdownController();
  TextEditingController _textController = TextEditingController();

  final GlobalKey _dsTextFieldKey = GlobalKey();
  late OverlaySupportEntry _overlaySupport;
  late void Function() _listener;

  void _listenController() {
    _listener = () {
      if (!_controller.overlayState) {
        _dismissOverlay();
      }
    };
    _controller.addListener(_listener);
  }

  @override
  void initState() {
    if (widget.textController != null) {
      _textController = widget.textController!;
    }
    if (widget.controller != null) {
      _controller = widget.controller!;
      _listenController();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DSTextFieldDropdownWidget oldWidget) {
    if (oldWidget != widget) {
      oldWidget.controller!.removeListener(_listener);
      _controller = widget.controller!;
      _listenController();
    }
    if (oldWidget != widget && widget.textController != null) {
      _textController = widget.textController!;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => DSTextField(
        key: _dsTextFieldKey,
        height: widget.height,
        contentPadding: widget.contentPadding,
        controller: _textController,
        hintText: widget.hintText,
        onChange: (_) {},
        disable: true,
        onTap: () {
          _showOverlay();
        },
      );

  void _showOverlay() {
    final RenderBox renderBox =
        _dsTextFieldKey.currentContext!.findRenderObject() as RenderBox;

    final Offset pos = renderBox.localToGlobal(Offset.zero);
    _overlaySupport = showOverlay(
        (_, __) => Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    _dismissOverlay();
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                    top: pos.dy + 60,
                    left: 0,
                    right: 0,
                    child: Material(
                      color: Colors.transparent,
                      child: widget.child,
                    )),
              ],
            ),
        duration: const Duration(hours: 100));
  }

  void _dismissOverlay() => _overlaySupport.dismiss(animate: false);
}
