import 'package:dig_mobile_app/app/designsystem/ds_text_style.dart';
import 'package:flutter/material.dart';

class DSPlainButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;

  const DSPlainButton({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Align(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: DSTextStyle.tsMontserratT16R.copyWith(color: Colors.white),
            ),
          ),
        ),
      );
}
