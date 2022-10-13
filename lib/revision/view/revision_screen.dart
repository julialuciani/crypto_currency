import 'package:flutter/material.dart';

import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/revision/widgets/body_revision_screen.dart';
import 'package:projeto_crypto/shared/templates/app_bar_default.dart';

class RevisionScreen extends StatelessWidget {
  static const route = '/revision';
  final String convertQuantity;
  final String receiveQuantity;
  final CryptoViewData cryptoConvert;
  final CryptoViewData cryptoReceive;
  final String total;
  final double discount;
  final double increase;
  final List<CryptoViewData> cryptos;

  const RevisionScreen({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.cryptoConvert,
    required this.cryptoReceive,
    required this.total,
    required this.discount,
    required this.increase,
    required this.cryptos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDefault(title: 'Revisar'),
      body: BodyRevision(
        convertQuantity: convertQuantity,
        cryptoConvert: cryptoConvert,
        cryptoReceive: cryptoReceive,
        receiveQuantity: receiveQuantity,
        total: total,
        increase: increase,
        discount: discount,
        idDiscount: cryptoConvert.id,
        idIncrease: cryptoReceive.id,
        cryptos: cryptos,
      ),
    );
  }
}
