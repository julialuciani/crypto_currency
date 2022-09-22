import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/details/controller/days_provider.dart';
import 'package:projeto_crypto/details/usecase/cryptos_market_data_provider.dart';
import 'package:projeto_crypto/details/widgets/row_infos.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/shared/utils/currency_formatter.dart';

import '../../shared/templates/button_default_app.dart';
import 'change_days_button.dart';
import 'chart_details_screen.dart';
import 'upper_column_crypto.dart';

class BodyDetailsScreen extends HookConsumerWidget {
  CryptoViewData crypto;
  BodyDetailsScreen({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var days = ref.watch(daysProvider.state).state;
    final marketData =
        ref.watch(marketDataProvider(DetailsArguments(id: crypto.id)));

    return FutureBuilder(
      future: ref.watch(marketDataProvider(
        DetailsArguments(
          id: crypto.id,
        ),
      ).future),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          double getVariation = (snapshot.data!.reversed.first.last /
                      snapshot.data!.reversed.elementAt(days).last -
                  1) *
              100;
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const UpperColumnCrypto(),
                ChartDetailsScreen(
                  list: List<FlSpot>.from(
                    snapshot.data!.reversed.map(
                      (e) => FlSpot(
                        e[0].toDouble(),
                        e[1].toDouble(),
                      ),
                    ),
                  ),
                ),
                const ChangeDaysButtons(),
                const Divider(thickness: 1),
                RowInfos(
                  title: 'Preço nos últimos $days dias',
                  info: FormatCurrency.format(
                    snapshot.data!.reversed.elementAt(days).last.toDouble(),
                  ),
                ),
                const Divider(thickness: 1),
                RowInfos(
                    title: 'Variação em $days dias',
                    info:
                        '${getVariation > 0 ? '+' : ''} ${getVariation.toStringAsFixed(2)}%'),
                const Divider(thickness: 1),
                RowInfos(
                    title: 'Quantidade',
                    info: '0.5 ${crypto.symbol.toUpperCase()}'),
                const Divider(thickness: 1),
                RowInfos(
                  title: 'Valor',
                  info: FormatCurrency.format(crypto.currentPrice * 0.5),
                ),
                const SizedBox(height: 5),
                const ButtonDetailsScreen(),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
