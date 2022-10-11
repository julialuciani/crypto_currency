import 'package:flutter/material.dart';

import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

import 'listview_crypto.dart';
import 'upper_container_crypto.dart';

class BodyPortifolioScreen extends StatelessWidget {
  final List<CryptoViewData> data;
  final List<double> singleBalance;
  const BodyPortifolioScreen({
    Key? key,
    required this.data,
    required this.singleBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UpperContainerCrypto(),
        const Divider(thickness: 1, height: 0.5),
        Expanded(
          key: const Key('expanded'),
          child: ListViewCryptos(
            data: data,
            singleBalance: singleBalance,
          ),
        ),
      ],
    );
  }
}
