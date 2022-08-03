import 'package:dig_core/dig_core.dart';
import 'package:collection/collection.dart';
import 'package:dig_mobile_app/app/definition/string.dart';

extension ListBalanceExtension on List<Balance> {
  double getDigBalance() {
    final balance = firstWhereOrNull((element) => Denom.udig == element.denom);
    return (double.tryParse(balance?.amount ?? '') ?? 0);
  }
}
