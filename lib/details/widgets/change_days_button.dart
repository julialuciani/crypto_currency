import 'package:flutter/material.dart';

import 'package:crypto/details/widgets/chart_button.dart';

class ChangeDaysButtons extends StatelessWidget {
  const ChangeDaysButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        ChartButton(
          title: '1D',
          daysButton: 1,
        ),
        ChartButton(
          title: '7D',
          daysButton: 7,
        ),
        ChartButton(
          title: '14D',
          daysButton: 14,
        ),
        ChartButton(
          title: '30D',
          daysButton: 30,
        ),
        ChartButton(
          title: '90D',
          daysButton: 90,
        ),
        ChartButton(
          title: '180D',
          daysButton: 180,
        ),
      ],
    );
  }
}
