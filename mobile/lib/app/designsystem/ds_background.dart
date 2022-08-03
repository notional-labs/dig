import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:flutter/material.dart';

class DSBackground extends StatelessWidget {
  final Widget child;
  final LinearGradient gradient;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  const DSBackground(
      {required this.child,
      this.onTap,
      this.gradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [DSColors.codGray, DSColors.tundora]),
      this.padding = const EdgeInsets.only(top: 15),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: padding,
        decoration: BoxDecoration(gradient: gradient),
        child: child,
      ),
    );
  }
}
