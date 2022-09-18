import 'package:crypto/portifolio/widgets/container_visible.dart';
import 'package:crypto/shared/utils/arguments.dart';
import 'package:crypto/shared/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:crypto/shared/models/crypto_model.dart';

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

    return ListTile(
      onTap: () {
        crypto.variation = updateDayVariation();
        Navigator.pushNamed(
          context,
          '/details',
          arguments: Arguments(crypto: crypto, days: 1),
        );
      },
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
              ? Text(FormatCurrency.format(crypto.howMuchUserHave))
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
    );
  }
}
