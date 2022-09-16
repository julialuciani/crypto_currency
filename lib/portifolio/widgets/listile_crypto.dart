import 'package:crypto/details/controller/current_price_provider.dart';
import 'package:crypto/details/controller/one_crypto_provider.dart';
import 'package:crypto/details/controller/variation_notifier.dart';
import 'package:crypto/portifolio/widgets/container_visible.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:crypto/shared/models/crypto_model.dart';

import '../../details/controller/days_provider.dart';
import '../controller/visibility_provider.dart';

class ListTitleCrypto extends HookConsumerWidget {
  final CryptoModel crypto;
  const ListTitleCrypto({Key? key, required this.crypto}) : super(key: key);

  double updateDayVariation() {
    return (crypto.priceInNinety.first.toDouble() /
                crypto.priceInNinety[1].toDouble() -
            1) *
        100;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visible = ref.watch(visibilityProvider.state);

    return InkWell(
      onTap: () {
        crypto.variation = updateDayVariation();
        ref.read(daysProvider.state).state = 1;
        ref.read(currrentPriceProvider.notifier).state = crypto.currentPrice;
        ref.read(variationProvider.notifier).state = crypto.variation;
        ref.read(oneCryptoProvider.notifier).changeDetailsCrypto(crypto);
        Navigator.pushNamed(context, '/details');
      },
      child: ListTile(
        minVerticalPadding: 20,
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(crypto.iconImage),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(crypto.abbreviation),
            visible.state
                ? Text(crypto.howMuchUserHave.toString())
                : const InvisibleContainer(),
          ],
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(crypto.name),
            visible.state
                ? Text(
                    '${crypto.quantity.toStringAsFixed(2)} ${crypto.abbreviation}')
                : const InvisibleContainer(),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
      ),
    );
  }
}
