import 'package:crypto/details/controller/crypto_api_provider.dart';
import 'package:crypto/details/controller/prices_notifier.dart';
import 'package:crypto/details/widgets/row_infos.dart';
import 'package:crypto/details/controller/days_provider.dart';
import 'package:crypto/shared/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ColumnInfos extends StatefulHookConsumerWidget {
  const ColumnInfos({Key? key}) : super(key: key);

  @override
  ConsumerState<ColumnInfos> createState() => _ColumnInfosState();
}

class _ColumnInfosState extends ConsumerState<ColumnInfos> {
  @override
  Widget build(BuildContext context) {
    var crypto = ref.watch(cryptoApiProvider.notifier).state;
    var days = ref.watch(daysProvider.state).state;
    var prices = ref.watch(changePriceProvider.notifier).state;

    double quantity = 0.5;

    double getPriceByDays() {
      double currentPrice = prices.isNotEmpty ? prices.first : 0;
      return currentPrice;
    }

    double getVariatonByDays() {
      double variation = 0;
      if (days != 1) {
        variation = ((prices.last / prices.first) - 1) * 100;
      } else {
        variation = crypto.priceChangeOneDay.toDouble();
      }
      return variation;
    }

    double calculateValue() {
      return quantity * crypto.currentPrice;
    }

    return Column(
      children: [
        const Divider(),
        RowInfos(
          title: days > 1 ? 'Preço nos últimos $days dias' : 'Preço atual',
          number: FormatCurrency.formatDouble(
              days == 1 ? crypto.currentPrice : getPriceByDays()),
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: days > 1 ? 'Variação ${days}D' : 'Variação 24H',
          number:
              '${crypto.priceChangeOneDay > 0 ? '' : '+'} ${getVariatonByDays().toStringAsFixed(2)}%',
          color: getVariatonByDays() > 0 ? Colors.green : Colors.red,
          isVariation: true,
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: 'Quantidade',
          number: '$quantity ${crypto.symbol}',
        ),
        const Divider(thickness: 1),
        RowInfos(
          title: 'Valor',
          number: FormatCurrency.formatDouble(calculateValue()).toString(),
        ),
      ],
    );
  }
}
