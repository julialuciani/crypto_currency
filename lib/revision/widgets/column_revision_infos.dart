import 'package:flutter/material.dart';

import 'package:projeto_crypto/revision/widgets/row_revision_info.dart';

import '../../portifolio/model/crypto_view_data.dart';

class ColumnRevisionInfo extends StatelessWidget {
  const ColumnRevisionInfo({
    Key? key,
    required this.convertQuantity,
    required this.cryptoConvert,
    required this.receiveQuantity,
    required this.cryptoReceive,
  }) : super(key: key);

  final String convertQuantity;
  final CryptoViewData cryptoConvert;
  final String receiveQuantity;
  final CryptoViewData cryptoReceive;

  String getConvertionFromOne() {
    double total = cryptoConvert.currentPrice / cryptoReceive.currentPrice;
    return '1 ${cryptoConvert.symbol.toUpperCase()} = ${total.toStringAsFixed(5)} ${cryptoReceive.symbol.toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 1),
        RowRevisionInfo(
          label: 'Converter',
          data: '$convertQuantity ${cryptoConvert.symbol.toUpperCase()}',
        ),
        const Divider(thickness: 1),
        RowRevisionInfo(label: 'Receber', data: receiveQuantity),
        const Divider(thickness: 1),
        RowRevisionInfo(
          label: 'Câmbio',
          data: getConvertionFromOne(),
        ),
      ],
    );
  }
}
