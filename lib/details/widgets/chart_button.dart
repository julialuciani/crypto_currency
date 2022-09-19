import 'package:crypto/details/controller/crypto_api_provider.dart';
import 'package:crypto/details/controller/graphic_repository_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:crypto/details/controller/days_provider.dart';

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
  // GraphicCryptoRepository repository = GraphicCryptoRepository(Dio());
  late Future<Response> dates;
  // late CryptoModelApi crypto;

  @override
  Widget build(BuildContext context) {
    var days = ref.watch(daysProvider.state);
    var crypto = ref.watch(cryptoApiProvider.notifier).state;
    var dateRepo = ref.watch(graphicProvider.state).state;
    // var oneCrypto = ref.watch(cryptoProvider.notifier).state;

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
            dateRepo.getDaysData(crypto, widget.daysButton);

            // ref
            //     .read(cryptoProvider.notifier)
            //     .variationInDays(widget.daysButton);
            // ref
            //     .read(currrentPriceProvider.notifier)
            //     .getCurrentPrice(widget.daysButton, oneCrypto);
            // oneCrypto.currentPrice =
            //     ref.read(currrentPriceProvider.notifier).state;
            // oneCrypto.variation =
            //     ref.read(cryptoProvider.notifier).state.variation;
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
