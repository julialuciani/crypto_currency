import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:crypto/details/controller/days_provider.dart';
import 'package:crypto/details/controller/prices_notifier.dart';
import 'package:crypto/portifolio/model/crypto_model_api.dart';

import '../controller/crypto_api_provider.dart';
import '../widgets/body_details_screen.dart';
import '../widgets/details_app_bar.dart';

class DetailsScreen extends HookConsumerWidget {
  static const route = '/details';
  CryptoModelApi crypto;

  DetailsScreen({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as CryptoModelApi;
    CryptoModelApi crypto = args;
    ref.read(cryptoApiProvider.notifier).state = crypto;

    Future.delayed(
      Duration.zero,
      () async {
        var days = ref.read(daysProvider.state).state;
        await ref.read(pricesProvider.notifier).getPriceRange(crypto.id, days);
        ref.read(changePriceProvider.state).state =
            ref.read(pricesProvider.notifier).state;
      },
    );

    return const Scaffold(
      appBar: DetailsAppBar(),
      body: BodyDetailsScreen(),
    );
  }
}
