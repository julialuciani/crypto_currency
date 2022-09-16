import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/colors.dart';
import '../../shared/providers/days_provider.dart';
import '../../shared/providers/one_crypto_provider.dart';

class ChartDetailsScreen extends HookConsumerWidget {
  const ChartDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var oneCrypto = ref.watch(oneCryptoProvider.notifier);
    var days = ref.watch(daysProvider.state);

    List<FlSpot> generateFlSpot() {
      List<FlSpot> listDays = [];
      if (days.state != 1) {
        for (int day = 0; day < days.state; day++) {
          listDays.add(
            FlSpot(
              day.toDouble(),
              oneCrypto.state.priceInNinety[day].toDouble(),
            ),
          );
        }
        return listDays;
      } else {
        for (int day = 0; day < oneCrypto.state.priceInOne.length; day++) {
          listDays.add(
            FlSpot(day.toDouble(), oneCrypto.state.priceInOne[day].toDouble()),
          );
        }
        return listDays;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
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
            ),
            titlesData: FlTitlesData(
              show: false,
            ),
            gridData: FlGridData(
              show: false,
            ),
            rangeAnnotations: RangeAnnotations(),
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade200,
                  width: 2,
                ),
              ),
            ),
            minY: oneCrypto.state.currentPrice.toDouble() * -150,
            maxY: oneCrypto.state.currentPrice.toDouble() * 60,
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
                barWidth: 4,
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
