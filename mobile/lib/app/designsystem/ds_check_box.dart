import 'package:flutter/material.dart';

class DSCheckBox extends StatefulWidget {
  final double width;
  final double height;
  final bool initialChecked;
  final Function(bool)? onChanged;

  const DSCheckBox(
      {this.width = 22,
      this.height = 22,
      this.initialChecked = false,
      this.onChanged,
      Key? key})
      : super(key: key);

  @override
  State<DSCheckBox> createState() => _DSCheckBoxState();
}

class _DSCheckBoxState extends State<DSCheckBox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.onChanged?.call(_isChecked);
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: Colors.white),
        ),
        child: _isChecked
            ? Icon(
                Icons.check,
                color: Colors.white,
                size: widget.width - 6,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
