import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/details/controller/days_provider.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

import '../widgets/body_details_screen.dart';
import '../widgets/details_app_bar.dart';

class DetailsScreen extends HookConsumerWidget {
  static const route = '/details';
  CryptoViewData crypto;

  DetailsScreen({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as CryptoViewData;
    CryptoViewData crypto = args;
    Future.delayed(Duration.zero, () {
      ref.read(daysProvider.state).state = 5;
    });

    return Scaffold(
      appBar: const DetailsAppBar(),
      body: BodyDetailsScreen(crypto: crypto),
    );
  }
}
