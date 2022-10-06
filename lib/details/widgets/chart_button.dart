import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/days_provider.dart';
import '../methods/details_methods.dart';

class ChartButton extends StatefulHookConsumerWidget {
  final int daysButton;
  final String title;
  const ChartButton({
    Key? key,
    required this.daysButton,
    required this.title,
  }) : super(key: key);

  @override
  ConsumerState<ChartButton> createState() => _ChartButtonState();
}

class _ChartButtonState extends ConsumerState<ChartButton> {
  @override
  Widget build(BuildContext context) {
    var days = ref.watch(daysProvider.state);

    return InkWell(
      onTap: () {
        setState(
          () {
            days.state = widget.daysButton;
            DetailsMethods.changeButtonColor(widget.daysButton, days.state);
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color:
              DetailsMethods.changeButtonColor(widget.daysButton, days.state),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
