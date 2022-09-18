import 'package:crypto/shared/models/crypto_model.dart';
import 'package:crypto/shared/utils/currency_formatter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/style/colors.dart';
import '../controller/crypto_provider.dart';
import '../controller/days_provider.dart';

class ChartDetailsScreen extends StatefulHookConsumerWidget {
  const ChartDetailsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChartDetailsScreen> createState() => _ChartDetailsScreenState();
}

class _ChartDetailsScreenState extends ConsumerState<ChartDetailsScreen> {
  late int days;
  late CryptoModel crypto;

  List<FlSpot> generateFlSpot() {
    List<FlSpot> listDays = [];
    if (days != 1) {
      for (int day = 0; day < days; day++) {
        listDays.add(
          FlSpot(
            day.toDouble(),
            crypto.priceInNinety[day].toDouble(),
          ),
        );
      }
      return listDays;
    } else {
      for (int day = 0; day < crypto.priceInOne.length; day++) {
        listDays.add(
          FlSpot(day.toDouble(), crypto.priceInOne[day].toDouble()),
        );
      }
      return listDays;
    }
  }

  @override
  Widget build(BuildContext context) {
    crypto = ref.watch(cryptoProvider.notifier).state;
    days = ref.watch(daysProvider.state).state;

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
            minY: crypto.currentPrice.toDouble() * -150,
            maxY: crypto.currentPrice.toDouble() * 60,
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
