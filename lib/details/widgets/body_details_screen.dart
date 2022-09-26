import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/details/controller/days_provider.dart';
import 'package:projeto_crypto/details/usecase/cryptos_market_data_provider.dart';
import 'package:projeto_crypto/details/widgets/row_infos.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/shared/style/colors.dart';
import 'package:projeto_crypto/shared/utils/currency_formatter.dart';

import '../../shared/templates/button_default_app.dart';
import 'change_days_button.dart';
import 'chart_details_screen.dart';
import 'upper_column_crypto.dart';

class BodyDetailsScreen extends HookConsumerWidget {
  CryptoViewData crypto;
  BodyDetailsScreen({Key? key, required this.crypto}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var days = ref.watch(daysProvider.state).state;
    final marketData = ref.watch(marketDataProvider(crypto.id));

    return marketData.when(
      data: ((data) {
        double getVariation =
            (data.price.last.last / data.price.reversed.elementAt(days).last -
                    1) *
                100;
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UpperColumnCrypto(crypto: crypto),
              ChartDetailsScreen(
                list: List<FlSpot>.from(
                  data.price.reversed.map(
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
                  data.price.reversed.elementAt(days).last.toDouble(),
                ),
              ),
              const Divider(thickness: 1),
              RowInfos(
                  title: 'Variação em $days dias',
                  isVariation: true,
                  color: getVariation > 0 ? Colors.green : Colors.red,
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
              ButtonDetailsScreen(
                crypto: crypto,
              ),
            ],
          ),
        );
      }),
      error: (error, stackTrace) {
        debugPrint(stackTrace.toString());
        debugPrint(error.toString());
        return const Text('Opps...Erro :(');
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(
            color: magenta,
          ),
        );
      },
    );
  }
}
