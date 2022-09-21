import 'package:crypto/details/controller/crypto_api_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpperColumnCrypto extends HookConsumerWidget {
  const UpperColumnCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var crypto = ref.watch(cryptoApiProvider.notifier).state;

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
            crypto.symbol,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            crypto.currentPrice.toString(),
            // FormatCurrency.format(crypto.priceInNinety.first),
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
