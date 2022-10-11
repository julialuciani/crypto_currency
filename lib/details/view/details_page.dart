import 'package:flutter/material.dart';

import 'package:projeto_crypto/details/view/details_screen.dart';
import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

import '../../l10n/core_strings.dart';
import '../../shared/templates/app_bar_default.dart';

class DetailsPage extends StatelessWidget {
  final CryptoViewData crypto;
  final double singleBalance;
  final List<CryptoViewData> list;
  const DetailsPage({
    Key? key,
    required this.crypto,
    required this.singleBalance,
    required this.list,
  }) : super(key: key);
  static const route = '/details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(title: CoreString.of(context)!.details),
      body: DetailsScreen(
          crypto: crypto, singleBalance: singleBalance, list: list),
    );
  }
}
