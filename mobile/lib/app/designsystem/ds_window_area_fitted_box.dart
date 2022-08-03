import 'package:flutter/material.dart';

class DSWindowAreaFittedBox extends StatelessWidget {
  final bool fitTop;
  final bool fitBottom;
  final bool fitLeft;
  final bool fitRight;
  final Color? color;

  DSWindowAreaFittedBox(
      {Key? key,
      this.fitTop = false,
      this.fitBottom = false,
      this.fitLeft = false,
      this.fitRight = false,
      this.color = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final padding = media.padding;
    final size = media.size;
    if (fitTop) {
      return _fitBox(size.width, padding.top);
    } else if (fitBottom) {
      return _fitBox(size.width, padding.bottom);
    } else if (fitLeft) {
      return _fitBox(padding.left, null);
    } else if (fitRight) {
      return _fitBox(padding.right, null);
    }
    return Container();
  }

  Widget _fitBox(double width, double? height) => Container(
        width: width,
        height: height,
        color: color!,
      );
}
