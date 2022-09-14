import 'package:crypto/shared/utils/providers/days_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ButtonChart extends StatefulHookConsumerWidget {
  final int daysButton;
  final String title;
  const ButtonChart({
    Key? key,
    required this.title,
    required this.daysButton,
  }) : super(key: key);

  @override
  ConsumerState<ButtonChart> createState() => _ButtonChartState();
}

class _ButtonChartState extends ConsumerState<ButtonChart> {
  @override
  Widget build(BuildContext context) {
    var days = ref.watch(daysProvider.state);

    Color changeButtonColor() {
      if (widget.daysButton == days.state) {
        return Colors.grey.shade300;
      } else {
        return Colors.transparent;
      }
    }

    return InkWell(
      onTap: () {
        setState(() {
          days.state = widget.daysButton;
          changeButtonColor();
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: changeButtonColor(),
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
