import 'package:crypto/details/controller/crypto_api_provider.dart';
import 'package:crypto/details/controller/prices_notifier.dart';
import 'package:crypto/details/repository/graphic_crypto_repository.dart';
import 'package:crypto/portifolio/model/crypto_model_api.dart';
import 'package:crypto/shared/utils/currency_formatter.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/style/colors.dart';
import '../controller/days_provider.dart';

class ChartDetailsScreen extends StatefulHookConsumerWidget {
  const ChartDetailsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChartDetailsScreen> createState() => _ChartDetailsScreenState();
}

class _ChartDetailsScreenState extends ConsumerState<ChartDetailsScreen> {
  GraphicCryptoRepository repository = GraphicCryptoRepository(Dio());
  // late List<double> prices;
  late CryptoModelApi crypto;
  late int days;

  @override
  void initState() {
    ref.read(gambiarra.state).state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var crypto = ref.watch(cryptoApiProvider.notifier).state;
    var days = ref.watch(daysProvider.state).state;

    var prices = ref.watch(gambiarra.state).state;
    List<FlSpot> generateFlSpot() {
      List<FlSpot> listDays = [];
      for (int day = 0; day < prices.length; day++) {
        listDays.add(
          FlSpot(day.toDouble(), prices[day]),
        );
      }
      return listDays;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      child: AspectRatio(
        aspectRatio: 1.9,
        child: LineChart(
          LineChartData(
            lineTouchData: LineTouchData(
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                  return spotIndexes.map((index) {
                    return TouchedSpotIndicatorData(
                      FlLine(
                        color: const Color.fromRGBO(224, 43, 87, 1),
                        strokeWidth: 1,
                        dashArray: [3, 3],
                      ),
                      FlDotData(
                        show: false,
                      ),
                    );
                  }).toList();
                },
                touchTooltipData: LineTouchTooltipData(
                    fitInsideHorizontally: true,
                    tooltipBgColor: magenta,
                    tooltipPadding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    tooltipRoundedRadius: 12,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((touchedSpot) {
                        return LineTooltipItem(
                          FormatCurrency.formatDouble(touchedSpot.y),
                          const TextStyle(color: Colors.white, fontSize: 12),
                        );
                      }).toList();
                    })),
            titlesData: FlTitlesData(
              show: false,
            ),
            gridData: FlGridData(
              show: false,
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade200,
                  width: 2,
                ),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                belowBarData: BarAreaData(
                  show: true,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(224, 43, 87, 0.3),
                      Color.fromRGBO(224, 43, 87, 0.05),
                    ],
                  ),
                ),
                color: magenta,
                barWidth: 2,
                dotData: FlDotData(
                  show: false,
                ),
                spots: generateFlSpot(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
