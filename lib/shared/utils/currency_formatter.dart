import 'package:intl/intl.dart';

class FormatCurrency {
  static String format(double price) {
    return NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
        .format(price);
  }
}
