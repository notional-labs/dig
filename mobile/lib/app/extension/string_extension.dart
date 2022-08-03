extension StringExtension on String {
  String trimMiddleWithDot(int length) {
    try {
      const numberOfDots = 3;
      final dotsString = List<String>.filled(numberOfDots, '.').join();

      final leftSizeLength = ((length - numberOfDots) / 2).floor();
      final rightSizeLength = this.length - leftSizeLength;
      final leftPart = substring(0, leftSizeLength);
      final rightPart = substring(rightSizeLength);
      return '$leftPart$dotsString$rightPart';
    } catch (_) {
      return this;
    }
  }

  DateTime? toDateTime() {
    return DateTime.tryParse(this);
  }
}
