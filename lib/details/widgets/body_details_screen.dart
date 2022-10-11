import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/details/controller/days_provider.dart';
import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';
import 'package:projeto_crypto/details/widgets/column_infos.dart';

import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';

import '../../l10n/core_strings.dart';
import '../../shared/templates/button_default_app.dart';
import '../methods/details_methods.dart';
import 'change_days_button.dart';
import 'chart_details_screen.dart';
import 'upper_column_crypto.dart';

class BodyDetailsScreen extends HookConsumerWidget {
  final CryptoViewData crypto;
  final double singleBalance;
  final CryptosMarkeDataViewData data;
  final List<CryptoViewData> list;
  const BodyDetailsScreen(
      {Key? key,
      required this.crypto,
      required this.singleBalance,
      required this.list,
      required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var days = ref.watch(daysProvider.state).state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          UpperColumnCrypto(crypto: crypto),
          const Spacer(),
          ChartDetailsScreen(
            list: List<FlSpot>.from(
              data.prices.reversed.map(
                (e) => FlSpot(
                  e[0].toDouble(),
                  e[1].toDouble(),
                ),
              ),
            ),
          ),
          const Spacer(),
          const ChangeDaysButtons(),
          const Spacer(),
          const Divider(thickness: 1),
          ColumnInfos(
              days: days,
              data: data,
              getVariation: DetailsMethods.getVariation(data, days),
              singleBalance: singleBalance,
              crypto: crypto),
          const Spacer(),
          ButtonDefaulApp(
            arguments: AppArguments(
                crypto: crypto, singleBalance: singleBalance, list: list),
            label: CoreString.of(context)!.conv,
            route: '/conversion',
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
