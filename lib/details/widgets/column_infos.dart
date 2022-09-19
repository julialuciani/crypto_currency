import 'package:crypto/details/widgets/row_infos.dart';
import 'package:crypto/details/controller/days_provider.dart';
import 'package:crypto/shared/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/crypto_provider.dart';

class ColumnInfos extends HookConsumerWidget {
  const ColumnInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cryptoModel = ref.watch(cryptoProvider.notifier).state;
    var days = ref.watch(daysProvider);

    return Column(
      children: [
        const Divider(),
        RowInfos(
          title: days > 1 ? 'Preço nos últimos $days dias' : 'Preço atual',
          number: FormatCurrency.format(cryptoModel.currentPrice),
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: days > 1 ? 'Variação ${days}D' : 'Variação 24H',
          number:
              '${cryptoModel.variation > 0 ? '+' : ''}${cryptoModel.variation.toStringAsFixed(2)}%',
          color: cryptoModel.variation > 0 ? Colors.green : Colors.red,
          isVariation: true,
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: 'Quantidade',
          number: '${cryptoModel.quantity} ${cryptoModel.abbreviation}',
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: 'Valor',
          number: FormatCurrency.format(cryptoModel.howMuchUserHave),
        ),
      ],
    );
  }
}
