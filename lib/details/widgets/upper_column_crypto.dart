import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:crypto/shared/utils/providers/one_crypto_provider.dart';

class UpperColumnCrypto extends StatefulHookConsumerWidget {
  //final CryptoModel crypto;
  const UpperColumnCrypto({
    Key? key,
    // required this.crypto,
  }) : super(key: key);

  @override
  ConsumerState<UpperColumnCrypto> createState() => _UpperColumnCryptoState();
}

class _UpperColumnCryptoState extends ConsumerState<UpperColumnCrypto> {
  @override
  Widget build(BuildContext context) {
    var oneCrypto = ref.watch(oneCryptoProvider.state).state;

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
          const SizedBox(height: 10),
          Text(
            NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
                .format(
              double.parse(oneCrypto.currentPrice.toString()),
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
