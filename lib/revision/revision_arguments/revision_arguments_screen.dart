import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

class RevisionArguments {
  String convertQuantity;
  String receiveQuantity;
  CryptoViewData cryptoConvert;
  CryptoViewData cryptoReceive;
  String total;
  double discount;
  double increase;
  String idDiscount;
  String idIncrease;
  RevisionArguments({
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.cryptoConvert,
    required this.cryptoReceive,
    required this.total,
    required this.discount,
    required this.increase,
    required this.idDiscount,
    required this.idIncrease,
  });
}
