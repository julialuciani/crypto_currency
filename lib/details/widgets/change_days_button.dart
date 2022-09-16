import 'package:crypto/details/widgets/button_chart.dart';
import 'package:flutter/material.dart';

class ChangeDaysButtons extends StatelessWidget {
  const ChangeDaysButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        ChartButton(
          title: '24H',
          daysButton: 24,
        ),
        ChartButton(
          title: '5D',
          daysButton: 5,
        ),
        ChartButton(
          title: '15D',
          daysButton: 15,
        ),
        ChartButton(
          title: '30D',
          daysButton: 30,
        ),
        ChartButton(
          title: '45D',
          daysButton: 45,
        ),
        ChartButton(
          title: '90D',
          daysButton: 90,
        ),
      ],
    );
  }
}
