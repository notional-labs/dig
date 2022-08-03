import 'package:dig_mobile_app/app/definition/string.dart';

extension NumberExtension on num {
  num toDigTokenDisplay() {
    return this / TokenBalanceRatio.ratio;
  }
}
