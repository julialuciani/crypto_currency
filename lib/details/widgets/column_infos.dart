import 'package:crypto/details/widgets/row_infos.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/models/crypto_model.dart';

class ColumnInfos extends StatelessWidget {
  const ColumnInfos({
    Key? key,
    required this.oneCrypto,
  }) : super(key: key);

  final CryptoModel oneCrypto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowInfos(
          title: 'Preço atual',
          number: NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
              .format(
            double.parse(oneCrypto.currentPrice.toString()),
          ),
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: 'Variação 24H',
          number:
              '${oneCrypto.variation > 0 ? '+' : ''}${oneCrypto.variation.toStringAsFixed(2)}%',
          color: oneCrypto.variation > 0 ? Colors.green : Colors.red,
          isVariation: true,
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: 'Quantidade',
          number: '${oneCrypto.quantity} ${oneCrypto.abbreviation}',
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: 'Valor',
          number: NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
              .format(double.parse(oneCrypto.howMuchUserHave.toString())),
        ),
      ],
    );
  }
}
