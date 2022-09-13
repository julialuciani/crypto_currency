import 'package:crypto/portifolio/widgets/container_coin.dart';
import 'package:flutter/material.dart';

import '../../shared/models/crypto_model.dart';

class ListViewCryptos extends StatelessWidget {
  const ListViewCryptos({
    Key? key,
    required this.cryptos,
  }) : super(key: key);

  final List<CryptoModel> cryptos;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        itemCount: cryptos.length,
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemBuilder: (context, index) {
          CryptoModel crypto = cryptos[index];
          return ContainerCoin(
            crypto: crypto,
          );
        },
      ),
    );
  }
}
