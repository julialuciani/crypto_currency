import 'package:crypto/portifolio/model/crypto_model_api.dart';
import 'package:crypto/portifolio/widgets/listile_crypto.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/crypto_list_provider_api.dart';
import '../controller/quantity_provider.dart';

class ListViewCryptos extends HookConsumerWidget {
  ListViewCryptos({Key? key}) : super(key: key);

  late List<CryptoModelApi> cryptos;

  double getBalance() {
    double balance = 0;
    for (CryptoModelApi crypto in cryptos) {
      balance += (crypto.currentPrice * 0.5);
    }
    return balance;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    cryptos = ref.watch(listCryptosProvider.notifier).state;

    Future.delayed(
      Duration.zero,
      () {
        ref.read(balanceProvider.state).state = getBalance();
        print(ref.read(balanceProvider.state).state);
      },
    );

    return Expanded(
      child: Visibility(
        visible: cryptos.isNotEmpty,
        child: ListView.separated(
          physics: const ClampingScrollPhysics(),
          itemCount: cryptos.length,
          separatorBuilder: (context, index) => const Divider(thickness: 1),
          itemBuilder: (context, index) {
            CryptoModelApi crypto = cryptos[index];
            return ListTitleCrypto(
              crypto: crypto,
            );
          },
        ),
      ),
    );
  }
}
