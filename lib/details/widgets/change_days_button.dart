import 'package:flutter/material.dart';
import 'chart_button.dart';

class ChangeDaysButtons extends StatelessWidget {
  const ChangeDaysButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
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
        ChartButton(
          title: '365D',
          daysButton: 365,
        ),
      ],
    );
  }
}
