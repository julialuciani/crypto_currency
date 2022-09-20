import 'package:crypto/details/controller/days_provider.dart';

import 'package:crypto/portifolio/model/crypto_model_api.dart';
import 'package:crypto/portifolio/widgets/container_visible.dart';
import 'package:crypto/shared/utils/currency_formatter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../details/repository/graphic_crypto_repository.dart';
import '../../shared/utils/arguments.dart';
import '../controller/visibility_provider.dart';

class ListTitleCrypto extends HookConsumerWidget {
  final CryptoModelApi crypto;

  ListTitleCrypto({Key? key, required this.crypto}) : super(key: key);

  // double updateDayVariation() {
  //   return (crypto.priceInNinety.first.toDouble() /
  //               crypto.priceInNinety[1].toDouble() -
  //           1) *
  //       100;
  // }
  GraphicCryptoRepository repository = GraphicCryptoRepository(Dio());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var visible = ref.watch(visibilityProvider.state);
    crypto.symbol = crypto.symbol.toUpperCase();
    var days = ref.watch(daysProvider.state).state;

    return ListTile(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: Arguments(crypto: crypto),
        );
      },
      minVerticalPadding: 20,
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(crypto.image),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(crypto.symbol),
          visible.state
              ? Text(FormatCurrency.formatDouble(crypto.currentPrice))
              : const InvisibleContainer(),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(crypto.name),
          visible.state
              ? Text('0.5 ${crypto.symbol}')
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
