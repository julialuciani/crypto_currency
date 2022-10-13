import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

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

  static String getTotalFormatted(CryptoViewData crypto, double convert) {
    if (convert == 0.0) {
      return '0.00 ${crypto.symbol.toUpperCase()}';
    }
    double total = convert / crypto.currentPrice;
    return '${total.toStringAsFixed(5)} ${crypto.symbol.toUpperCase()}';
  }

  static double getTotal(double currentPrice, double convert) {
    if (convert == 0.0) {
      return 0;
    }
    double total = convert / currentPrice;
    return total;
  }

  static double getIncrease(double textFieldHelper, double rightCurrentPrice) {
    return textFieldHelper / rightCurrentPrice;
  }
}
