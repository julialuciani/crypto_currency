import 'package:crypto/shared/providers/current_price_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:crypto/shared/providers/days_provider.dart';
import 'package:crypto/shared/providers/variation_notifier.dart';

import '../../shared/providers/one_crypto_provider.dart';

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
    var oneCrypto = ref.watch(oneCryptoProvider.notifier).state;

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
            changeButtonColor();
            ref
                .read(variationProvider.notifier)
                .variationInDays(widget.daysButton, oneCrypto);
            ref
                .read(currrentPriceProvider.notifier)
                .getCurrentPrice(widget.daysButton, oneCrypto);
            oneCrypto.currentPrice =
                ref.read(currrentPriceProvider.notifier).state;
            oneCrypto.variation = ref.read(variationProvider.notifier).state;
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
