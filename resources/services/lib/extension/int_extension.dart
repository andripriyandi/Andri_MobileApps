import 'package:dependencies/intl/intl.dart';

extension IntExtension on int {
  String toMoneyIdrFormat() {
    switch (toString().length) {
      case 4:
        return "${toString().substring(0, 1)}.${toString().substring(1, 4)}";
      case 5:
        return "${toString().substring(0, 2)}.${toString().substring(2, 5)}";
      case 6:
        return "${toString().substring(0, 3)}.${toString().substring(3, 6)}";
      case 7:
        return "${toString().substring(0, 1)}.${toString().substring(1, 4)}.${toString().substring(4, 7)}";
      case 8:
        return "${toString().substring(0, 2)}.${toString().substring(2, 5)}.${toString().substring(5, 8)}";
      case 9:
        return "${toString().substring(0, 3)}.${toString().substring(3, 6)}.${toString().substring(6, 9)}";
      case 10:
        return "${toString().substring(0, 1)}.${toString().substring(1, 4)}.${toString().substring(4, 7)}.${toString().substring(7, 10)}";
      case 11:
        return "${toString().substring(0, 2)}.${toString().substring(2, 5)}.${toString().substring(5, 8)}.${toString().substring(8, 11)}";
      case 12:
        return "${toString().substring(0, 3)}.${toString().substring(3, 6)}.${toString().substring(6, 9)}.${toString().substring(9, 12)}";
      case 13:
        return "${toString().substring(0, 1)}.${toString().substring(1, 4)}.${toString().substring(4, 7)}.${toString().substring(7, 10)}.${toString().substring(10, 13)}";
      case 14:
        return "${toString().substring(0, 2)}.${toString().substring(2, 5)}.${toString().substring(5, 8)}.${toString().substring(8, 11)}.${toString().substring(11, 14)}";
      case 15:
        return "${toString().substring(0, 3)}.${toString().substring(3, 6)}.${toString().substring(6, 9)}.${toString().substring(9, 12)}.${toString().substring(12, 15)}";
      default:
        toString();
    }
    return toString();
  }

  // Formatter Currency
  String toCurrencyFormat() =>
      NumberFormat.decimalPattern('id').format(int.parse(toString()));
  // String get currency =>
  //     NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  static int roundUpAbsolute(double number) {
    return number.isNegative ? number.floor() : number.ceil();
  }
}
