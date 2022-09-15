import 'package:crypto/details/widgets/row_infos.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/utils/providers/one_crypto_provider.dart';

class ColumnInfos extends HookConsumerWidget {
  const ColumnInfos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cryptoModel = ref.watch(oneCryptoProvider.notifier).state;

    return Column(
      children: [
        RowInfos(
          title: 'Preço atual',
          number: NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
              .format(
            double.parse(cryptoModel.priceInNinety.first.toString()),
          ),
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: 'Variação 24H',
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
          number: NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
              .format(double.parse(cryptoModel.howMuchUserHave.toString())),
        ),
      ],
    );
  }
}
