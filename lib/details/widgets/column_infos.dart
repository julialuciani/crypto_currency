import 'package:flutter/material.dart';
import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';
import 'package:projeto_crypto/details/widgets/row_infos.dart';

import '../../l10n/core_strings.dart';
import '../../portfolio/model/crypto_view_data.dart';
import '../../shared/utils/currency_formatter.dart';

class ColumnInfos extends StatelessWidget {
  const ColumnInfos({
    Key? key,
    required this.days,
    required this.data,
    required this.getVariation,
    required this.singleBalance,
    required this.crypto,
  }) : super(key: key);

  final int days;
  final CryptosMarkeDataViewData data;
  final double getVariation;
  final double singleBalance;
  final CryptoViewData crypto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowInfos(
          title: CoreString.of(context)!.prices(days),
          info: FormatCurrency.format(
            data.prices.reversed.elementAt(days).last.toDouble(),
          ),
        ),
        const Divider(thickness: 1),
        RowInfos(
            title: CoreString.of(context)!.variation(days),
            isVariation: true,
            color: getVariation > 0 ? Colors.green : Colors.red,
            info:
                '${getVariation > 0 ? '+' : ''} ${getVariation.toStringAsFixed(2)}%'),
        const Divider(thickness: 1),
        RowInfos(
            title: CoreString.of(context)!.quant,
            info:
                '${singleBalance.toStringAsFixed(8)} ${crypto.symbol.toUpperCase()}'),
        const Divider(thickness: 1),
        RowInfos(
          title: CoreString.of(context)!.value,
          info: FormatCurrency.format(crypto.currentPrice * singleBalance),
        ),
      ],
    );
  }
}
