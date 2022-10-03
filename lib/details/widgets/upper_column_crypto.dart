import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

import '../../shared/utils/currency_formatter.dart';

class UpperColumnCrypto extends HookConsumerWidget {
  final CryptoViewData crypto;
  const UpperColumnCrypto({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              Image.network(
                crypto.image,
                scale: 4,
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
