import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/details/controller/days_provider.dart';

import '../../shared/style/colors.dart';

class ChartDetailsScreen extends HookConsumerWidget {
  final List<FlSpot> list;
  const ChartDetailsScreen({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: 21 / 5,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
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
              spots: list.sublist(0, ref.watch(daysProvider.state).state + 1),
            ),
          ],
        ),
      ),
    );
  }
}
