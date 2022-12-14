import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

class ConversionMethods {
  static String formattingValue(String value) {
    return value.replaceAll(RegExp(r'[^\w\s]+'), '.');
  }

  static bool isCorrect(String value) {
    return !value.startsWith(RegExp(r'[!@#$%^&*()-/+.,?":{}|<>]'));
  }

  static double convertLeftValueToReal(
      String valueController, CryptoViewData cryptoLeft) {
    double value = 0.0;
    if (valueController == '' || valueController == '.') {
      value = 0.0;
    } else {
      value = double.parse(valueController) * cryptoLeft.currentPrice;
    }
    return value;
  }

  static double getIncrease(double textFieldHelper, double rightCurrentPrice) {
    return textFieldHelper / rightCurrentPrice;
  }
}
