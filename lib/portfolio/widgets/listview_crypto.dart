import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

import '../controller/balance_provider.dart';
import '../methods/portifolio_methods.dart';
import 'listile_crypto.dart';

class ListViewCryptos extends HookConsumerWidget {
  final List<CryptoViewData> data;
  final List<double> singleBalance;
  const ListViewCryptos({
    Key? key,
    required this.data,
    required this.singleBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(Duration.zero, () {
      ref.read(balanceProvider.state).state =
          PortifolioMethods.getBalance(data, singleBalance);
    });
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      itemCount: data.length,
      separatorBuilder: (context, index) => const Divider(thickness: 1),
      itemBuilder: (context, index) {
        CryptoViewData crypto = data[index];
        return ListTitleCrypto(
          crypto: crypto,
          cryptoBalance: singleBalance[index],
          list: data,
        );
      },
    );
  }
}
