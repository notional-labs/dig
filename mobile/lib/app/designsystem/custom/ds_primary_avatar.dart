import 'package:dig_mobile_app/app/definition/app_assets.dart';
import 'package:flutter/material.dart';

class DSPrimaryAvatar extends StatelessWidget {
  final Color backgroundColor;

  const DSPrimaryAvatar({this.backgroundColor = Colors.white, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 90,
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  width: 73,
                  height: 73,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                  )),
            ),
          ),
          Positioned.directional(
              textDirection: TextDirection.ltr,
              top: 4,
              start: 4,
              child: Image.asset(
                AppAssets.icDiggerHead,
                width: 50,
                height: 36,
              ))
        ],
      ),
    );
  }
}
