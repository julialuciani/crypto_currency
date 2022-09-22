import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/currency_formatter.dart';
import '../controller/crypto_api_provider.dart';

class UpperColumnCrypto extends HookConsumerWidget {
  const UpperColumnCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var crypto = ref.watch(cryptoProvider.notifier).state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                crypto.name,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25,
                backgroundImage: NetworkImage(crypto.image),
              ),
            ],
          ),
          Text(
            crypto.symbol.toUpperCase(),
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            FormatCurrency.format(crypto.currentPrice),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}
