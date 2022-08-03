import 'package:dig_mobile_app/app/definition/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DSPinInputController extends ValueNotifier<String> {
  DSPinInputController({String initialPin = ''}) : super(initialPin);

  String get text => value;

  void add(String singlePin) {
    value = value + singlePin;
  }

  void clear() {
    value = '';
  }

  void delete() {
    if (value.length <= 1) {
      clear();
      return;
    }

    value = value.substring(0, value.length - 1);
  }
}

typedef OnPINChange = Function(String pin);

/// [OnPINFit] return:
///   * `true`: Reset all pin
///   * `false`: Keep current pin
typedef OnPINFit = Future<bool> Function(String pin);

class DSPinInput extends StatefulWidget {
  final OnPINChange onChange;
  final OnPINFit onPINFit;
  final int length;
  final DSPinInputController? controller;
  const DSPinInput(
      {required this.onChange,
      required this.onPINFit,
      this.length = PinConfig.length,
      this.controller,
      Key? key})
      : super(key: key);

  @override
  _DSPinInputState createState() => _DSPinInputState();
}

class _DSPinInputState extends State<DSPinInput> {
  final TextEditingController _textEditingController = TextEditingController();
  DSPinInputController _controller = DSPinInputController();

  List<Widget> _resolvePinItem() => List.generate(widget.length, (index) {
        if (index < _controller.text.length) {
          return const _DSDotPinItem();
        }
        return const _DSEmptyPinItem();
      });

  void _onPinChange(String value) {
    final pin = value;
    if (pin.isNotEmpty) {
      widget.onChange(pin);
      _onPinFit(pin);
    }
    setState(() {});
  }

  Future _onPinFit(String pin) async {
    if (pin.length == widget.length) {
      final shouldResetPin = await widget.onPINFit(pin);
      if (shouldResetPin) {
        setState(() {
          _controller.clear();
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller!;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.addListener(() {
        _textEditingController.text = _controller.text;
        _onPinChange(_controller.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _resolvePinItem(),
          ),
          SizedBox(
            width: 0,
            height: 0,
            child: TextField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(widget.length),
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          ),
        ],
      );
}

class _DSEmptyPinItem extends StatelessWidget {
  const _DSEmptyPinItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white)),
      );
}

class _DSDotPinItem extends StatelessWidget {
  const _DSDotPinItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      );
}
