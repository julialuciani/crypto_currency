import 'package:crypto/shared/utils/providers/days_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/providers/one_crypto_provider.dart';

class ChartButton extends StatefulHookConsumerWidget {
  final int daysButton;
  final String title;
  const ChartButton({
    Key? key,
    required this.title,
    required this.daysButton,
  }) : super(key: key);

  @override
  ConsumerState<ChartButton> createState() => _ButtonChartState();
}

class _ButtonChartState extends ConsumerState<ChartButton> {
  @override
  Widget build(BuildContext context) {
    var days = ref.watch(daysProvider.state);
    var oneCrypto = ref.watch(oneCryptoProvider.notifier);

    Color changeButtonColor() {
      if (widget.daysButton == days.state) {
        return Colors.grey.shade300;
      } else {
        return Colors.transparent;
      }
    }

    return InkWell(
      onTap: () {
        setState(
          () {
            days.state = widget.daysButton;
            days.state > 1
                ? oneCrypto.state.variation = ref
                    .read(oneCryptoProvider.notifier)
                    .variationInDays(widget.daysButton, oneCrypto.state)
                : oneCrypto.state.variation = ref
                    .read(oneCryptoProvider.notifier)
                    .variationInOneDay(oneCrypto.state);
            debugPrint(oneCrypto.state.variation.toString());
            changeButtonColor();
          },
        );
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
