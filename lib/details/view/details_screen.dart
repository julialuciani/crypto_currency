import 'package:crypto/details/controller/current_price_provider.dart';
import 'package:crypto/shared/models/crypto_model.dart';
import 'package:crypto/shared/utils/arguments.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controller/crypto_provider.dart';
import '../widgets/body_details_screen.dart';
import '../widgets/details_app_bar.dart';

class DetailsScreen extends HookConsumerWidget {
  static const route = '/details';

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    CryptoModel crypto = args.crypto;
    ref.read(cryptoProvider.notifier).state = crypto;
    ref.read(currrentPriceProvider.notifier).state = crypto.currentPrice;

    return const Scaffold(
      appBar: DetailsAppBar(),
      body: BodyDetailsScreen(),
    );
  }
}
