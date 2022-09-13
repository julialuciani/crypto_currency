import 'package:crypto/shared/utils/providers/crypto_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/design_system/colors.dart';
import '../../shared/widgets/button_default_app.dart';
import '../widgets/row_infos.dart';
import '../widgets/upper_column_crypto.dart';

class DetailsPage extends StatefulHookConsumerWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends ConsumerState<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final crypto = ref.watch(cryptosListProvider);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const UpperColumnCrypto(),
            Container(
              margin: const EdgeInsets.all(10),
              height: 150,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 8,
                  minY: 0,
                  maxY: 5,
                  titlesData: FlTitlesData(
                    show: false,
                  ),
                  gridData: FlGridData(
                    show: false,
                  ),
                  rangeAnnotations: RangeAnnotations(),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      color: magenta,
                      barWidth: 4,
                      dotData: FlDotData(
                        show: false,
                      ),
                      spots: [
                        const FlSpot(0, 0),
                        const FlSpot(0.5, 1),
                        const FlSpot(1, 0.5),
                        const FlSpot(3, 1.5),
                        const FlSpot(4, 1),
                        const FlSpot(5, 2),
                        const FlSpot(6, 2.5),
                        const FlSpot(7, 3),
                        const FlSpot(9, 3.5),
                        const FlSpot(10, 3),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                MaterialButton(
                  minWidth: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.grey.shade300,
                  onPressed: () {},
                  child: const Text(
                    '5D',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Divider(thickness: 1),
            const RowInfos(title: 'Preço atual'),
            const Divider(thickness: 1),
            const RowInfos(title: 'Variação'),
            const Divider(thickness: 1),
            const RowInfos(title: 'Quantidade'),
            const Divider(thickness: 1),
            const RowInfos(title: 'Preço atual'),
            const SizedBox(height: 10),
            const ButtonDefaultApp(),
          ],
        ),
      ),
    );
  }
}
