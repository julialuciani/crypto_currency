import 'package:crypto/conversion/view/conversion_page.dart';
import 'package:crypto/details/widgets/button_chart.dart';
import 'package:crypto/shared/utils/providers/days_provider.dart';
import 'package:crypto/shared/utils/providers/one_crypto_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/utils/design_system/colors.dart';
import '../../shared/widgets/button_default_app.dart';
import '../widgets/column_infos.dart';
import '../widgets/upper_column_crypto.dart';

class DetailsPage extends StatefulHookConsumerWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    var oneCrypto = ref.watch(oneCryptoProvider.notifier);
    var days = ref.watch(daysProvider.state);

    List<FlSpot> generateFlSpot() {
      List<FlSpot> listDays = [];
      for (int day = 0; day < days.state; day++) {
        listDays.add(
          FlSpot(day.toDouble(), oneCrypto.state.priceInNinety[day].toDouble()),
        );
      }
      return listDays;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color.fromARGB(255, 245, 246, 250),
        title: const Text(
          'Detalhes',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const UpperColumnCrypto(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              child: AspectRatio(
                aspectRatio: 3,
                child: LineChart(
                  LineChartData(
                    minX: 0,
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ButtonChart(
                  title: '5D',
                  daysButton: 5,
                ),
                ButtonChart(
                  title: '15D',
                  daysButton: 15,
                ),
                ButtonChart(
                  title: '30D',
                  daysButton: 30,
                ),
                ButtonChart(
                  title: '45D',
                  daysButton: 45,
                ),
                ButtonChart(
                  title: '90D',
                  daysButton: 90,
                ),
              ],
            ),
            const Divider(thickness: 1),
            ColumnInfos(),
            const SizedBox(height: 10),
            const ButtonDefaultApp(
              action: ConversionPage(),
            ),
          ],
        ),
      ),
    );
  }
}
