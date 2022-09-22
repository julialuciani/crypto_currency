import 'package:intl/intl.dart';

class FormatCurrency {
  static String format(double price) {
    return NumberFormat.currency(locale: 'en', decimalDigits: 2).format(price);
  }
}
