import 'package:crypto/shared/utils/providers/one_crypto_provider.dart';
import 'package:crypto/shared/utils/providers/variation_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:crypto/portifolio/widgets/container_visible.dart';
import 'package:crypto/shared/models/crypto_model.dart';

import '../../shared/utils/providers/days_provider.dart';
import '../../shared/utils/providers/visibility_provider.dart';

class ContainerCoin extends HookConsumerWidget {
  final CryptoModel crypto;

  const ContainerCoin({Key? key, required this.crypto}) : super(key: key);

  double updateDayVariation() {
    return (crypto.priceInNinety.first.toDouble() /
                crypto.priceInNinety[1].toDouble() -
            1) *
        100;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visible = ref.watch(visibilityProvider.state);
    var oneCrypto = ref.watch(oneCryptoProvider.notifier).state;

    return InkWell(
      onTap: () {
        crypto.variation = updateDayVariation();
        ref.read(daysProvider.state).state = 1;
        ref.read(oneCryptoProvider.notifier).changeDetailsCrypto(crypto);
        ref.read(variationProvider.notifier).state = crypto.variation;
        Navigator.pushNamed(context, '/details');
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(crypto.iconImage),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  crypto.abbreviation,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  crypto.name,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
                ),
              ],
            ),
            const Spacer(),
            visible.state
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        NumberFormat.simpleCurrency(
                                locale: 'pt-BR', decimalDigits: 2)
                            .format(double.parse(
                                crypto.howMuchUserHave.toString())),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            '${crypto.quantity.toStringAsFixed(2)} ${crypto.abbreviation}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                : Column(
                    children: const [
                      ContainerVisible(),
                      SizedBox(height: 8),
                      ContainerVisible(),
                    ],
                  ),
            const SizedBox(width: 10),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade500,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
