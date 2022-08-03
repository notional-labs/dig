import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

class DSPrimaryButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final bool enable;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final Widget? leftIcon;
  final Widget? rightIcon;

  const DSPrimaryButton({
    required this.title,
    required this.onTap,
    this.enable = true,
    this.width = double.infinity,
    this.height = 50,
    this.textStyle,
    this.leftIcon,
    this.rightIcon,
    Key? key,
  }) : super(key: key);

  LinearGradient get _resolveBackgroundColor => enable
      ? const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [DSColors.tulipTree, DSColors.yellowOrange])
      : const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [DSColors.silver2, DSColors.silver2]);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: enable ? onTap : null,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              gradient: _resolveBackgroundColor),
          width: width,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              Text(
                title,
                textAlign: TextAlign.center,
                style: textStyle ??
                    DSTextStyle.tsMontserratT20B.copyWith(color: Colors.white),
              ),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      );
}
