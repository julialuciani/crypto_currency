import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/colors.dart';
import '../../shared/utils/providers/days_provider.dart';
import '../../shared/utils/providers/one_crypto_provider.dart';

class ChartDetailsScreen extends StatefulHookConsumerWidget {
  const ChartDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ChartDetailsScreen> createState() => _ChartDetailsScreenState();
}

class _ChartDetailsScreenState extends ConsumerState<ChartDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var oneCrypto = ref.watch(oneCryptoProvider.notifier);
    var days = ref.watch(daysProvider.state);

    List<FlSpot> generateFlSpot() {
      List<FlSpot> listDays = [];
      if (days.state > 1) {
        for (int day = 0; day < days.state; day++) {
          listDays.add(
            FlSpot(
                day.toDouble(), oneCrypto.state.priceInNinety[day].toDouble()),
          );
        }
      } else if (days.state == 1) {
        for (int day = 0; day < days.state; day++) {
          listDays.add(
            FlSpot(day.toDouble(), oneCrypto.state.priceInOne[day].toDouble()),
          );
        }
        debugPrint(listDays.toString());
      }
      return listDays;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: AspectRatio(
        aspectRatio: 1.7,
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
