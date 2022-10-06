import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/details/controller/days_provider.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';

import '../../l10n/core_strings.dart';
import '../../shared/templates/app_bar_default.dart';
import '../widgets/body_details_screen.dart';

class DetailsScreen extends HookConsumerWidget {
  static const route = '/details';
  final CryptoViewData crypto;
  final double singleBalance;
  const DetailsScreen({
    Key? key,
    required this.crypto,
    required this.singleBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as AppArguments;
    CryptoViewData crypto = args.crypto;
    Future.delayed(Duration.zero, () {
      ref.read(daysProvider.state).state = 5;
    });

    return Scaffold(
      appBar: AppBarDefault(title: CoreString.of(context)!.details),
      body: BodyDetailsScreen(
        crypto: crypto,
        singleBalance: singleBalance,
      ),
    );
  }
}
