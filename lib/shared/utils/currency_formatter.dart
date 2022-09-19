import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

class FormatCurrency {
  static String format(Decimal price) {
    return NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
        .format(price.toDouble());
  }

  static String formatDouble(double price) {
    return NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
        .format(price);
  }
}
