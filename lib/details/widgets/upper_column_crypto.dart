import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:crypto/details/controller/one_crypto_provider.dart';

class UpperColumnCrypto extends HookConsumerWidget {
  const UpperColumnCrypto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var oneCrypto = ref.watch(oneCryptoProvider.notifier).state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                oneCrypto.name,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 25,
                backgroundImage: AssetImage(oneCrypto.iconImage),
              ),
            ],
          ),
          Text(
            oneCrypto.abbreviation,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
                .format(
              double.parse(oneCrypto.priceInNinety.first.toString()),
            ),
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
