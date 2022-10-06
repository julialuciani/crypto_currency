import 'dart:io';

import 'package:intl/intl.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

class ConversionMethods {
  static String formattingValue(String value) {
    return value.replaceAll(RegExp(r'[^\w\s]+'), '.');
  }

  static bool isCorrect(String value) {
    return !value.startsWith(RegExp(r'[!@#$%^&*()-/+.,?":{}|<>]'));
  }

  static double convertLatestValue(
      String valueController, CryptoViewData crypto) {
    double value = 0.0;
    if (valueController == '' || valueController == '.') {
      value = 0.0;
    } else {
      value = double.parse(valueController) * crypto.currentPrice;
    }
    return value;
  }

  static String formatLatestValue(double price) {
    String value = NumberFormat.simpleCurrency(
            locale: Platform.localeName == 'pt_BR' ? 'pt_BR' : 'en',
            decimalDigits: 2)
        .format(price);
    return value;
  }

  static String getTotal(CryptoViewData crypto, double convert) {
    if (convert == 0.0) {
      return '0.00 ${crypto.symbol.toUpperCase()}';
    }
    double total = convert / crypto.currentPrice;
    return '${total.toStringAsFixed(10)} ${crypto.symbol.toUpperCase()}';
  }
}
