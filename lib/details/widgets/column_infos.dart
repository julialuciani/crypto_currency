import 'package:crypto/details/controller/crypto_api_provider.dart';
import 'package:crypto/details/controller/graphic_repository_provider.dart';
import 'package:crypto/details/widgets/row_infos.dart';
import 'package:crypto/details/controller/days_provider.dart';
import 'package:crypto/shared/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ColumnInfos extends HookConsumerWidget {
  const ColumnInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var cryptoModel = ref.watch(cryptoProvider.notifier).state;
    var crypto = ref.watch(cryptoApiProvider.notifier).state;
    var days = ref.watch(daysProvider);
    var dateRepo = ref.watch(graphicProvider.state).state;

    double calculateValue(double quantity) {
      return quantity * crypto.currentPrice;
    }

    return Column(
      children: [
        const Divider(),
        RowInfos(
          title: days > 1 ? 'Preço nos últimos $days dias' : 'Preço atual',
          number: FormatCurrency.formatDouble(crypto.currentPrice),
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: days > 1 ? 'Variação ${days}D' : 'Variação 24H',
          number:
              '${crypto.priceChangeOneDay > 0 ? '+' : ''}${crypto.priceChangeOneDay.toStringAsFixed(2)}%',
          color: crypto.priceChangeOneDay > 0 ? Colors.green : Colors.red,
          isVariation: true,
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: 'Quantidade',
          number: '0,65 ${crypto.symbol}',
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: 'Valor',
          number: FormatCurrency.formatDouble(calculateValue(0.65)).toString(),
          // number: FormatCurrency.format(cryptoModel.howMuchUserHave),
        ),
      ],
    );
  }
}
