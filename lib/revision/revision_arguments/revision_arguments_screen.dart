import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

class RevisionArguments {
  String convertQuantity;
  String receiveQuantity;
  CryptoViewData cryptoConvert;
  CryptoViewData cryptoReceive;
  String total;
  double discount;
  double increase;
  List<CryptoViewData> cryptos;
  RevisionArguments({
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.cryptoConvert,
    required this.cryptoReceive,
    required this.total,
    required this.discount,
    required this.increase,
    required this.cryptos,
  });
}
