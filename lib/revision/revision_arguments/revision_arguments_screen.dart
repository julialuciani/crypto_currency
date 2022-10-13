import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

class RevisionArguments {
  double convertQuantity;
  double receiveQuantity;
  CryptoViewData cryptoConvert;
  CryptoViewData cryptoReceive;
  List<CryptoViewData> cryptos;
  RevisionArguments({
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.cryptoConvert,
    required this.cryptoReceive,
    required this.cryptos,
  });
}
