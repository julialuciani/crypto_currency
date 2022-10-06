import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

class RevisionMethods {
  static String getConvertionFromOne(
      CryptoViewData cryptoConvert, CryptoViewData cryptoReceive) {
    double total = cryptoConvert.currentPrice / cryptoReceive.currentPrice;
    return '1 ${cryptoConvert.symbol.toUpperCase()} = ${total.toStringAsFixed(5)} ${cryptoReceive.symbol.toUpperCase()}';
  }
}
