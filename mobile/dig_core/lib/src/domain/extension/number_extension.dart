import 'package:intl/intl.dart';

extension NumberExts on num {
  String formatCurrency() {
    final formatCurrency = NumberFormat.simpleCurrency(decimalDigits: 0);
    return formatCurrency.format(this);
  }
}

extension DoubleExtension on double {
  double toPrecision(int n) => double.tryParse(toStringAsFixed(n)) ?? 0;
}
