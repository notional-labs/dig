import 'package:dig_mobile_app/app/designsystem/ds_colors.dart';
import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

class DSSecondaryButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final bool enable;
  final Color backgroundColor;

  const DSSecondaryButton({
    required this.title,
    required this.onTap,
    this.enable = true,
    this.backgroundColor = DSColors.tulipTree,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: enable ? onTap : null,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          width: double.infinity,
          height: 30,
          child: Align(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: DSTextStyle.tsMontserratT12R.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
