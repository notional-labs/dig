import 'package:dig_mobile_app/app/route/dig_route.dart';
import 'package:flutter/material.dart';

mixin ImageUtil {
  Future precacheImages(List<String> imagePaths) async {
    for (final image in imagePaths) {
      await precacheImage(
          AssetImage(image), navigatorKey.currentState!.context);
    }
  }
}
