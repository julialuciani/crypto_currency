import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

class PortifolioMethods {
  static double getBalance(
      List<CryptoViewData> data, List<double> singleBalance) {
    double balance = 0;
    for (CryptoViewData crypto in data) {
      balance += crypto.currentPrice * singleBalance[data.indexOf(crypto)];
    }
    return balance;
  }
}
