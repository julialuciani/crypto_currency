import 'package:crypto/details/controller/crypto_api_provider.dart';
import 'package:crypto/portifolio/model/crypto_model_api.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/utils/arguments.dart';
import '../widgets/body_details_screen.dart';
import '../widgets/details_app_bar.dart';

class DetailsScreen extends HookConsumerWidget {
  static const route = '/details';

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Arguments;
    CryptoModelApi crypto = args.crypto;
    ref.read(cryptoApiProvider.notifier).state = crypto;
    // ref.read(cryptoProvider.notifier).state = crypto;
    // ref.read(currrentPriceProvider.notifier).state = crypto.currentPrice;

    return const Scaffold(
      appBar: DetailsAppBar(),
      body: BodyDetailsScreen(),
    );
  }
}
