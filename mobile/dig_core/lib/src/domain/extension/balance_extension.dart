import 'package:dig_core/dig_core.dart';

extension BalanceExtension on Balance {
  num getToken([num ratio = 1000000]) {
    return (double.tryParse(amount) ?? 0);
  }
}
