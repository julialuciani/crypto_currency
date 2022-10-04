import 'package:intl/intl.dart';
import 'dart:io';

class FormatCurrency {
  static String format(double price) {
    return NumberFormat.simpleCurrency(
            locale: Platform.localeName == 'pt_BR' ? 'pt_BR' : 'en',
            decimalDigits: 2)
        .format(price);
  }
}
