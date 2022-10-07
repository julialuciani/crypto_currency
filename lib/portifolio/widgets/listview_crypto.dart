import 'package:flutter/material.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

import 'listile_crypto.dart';

class ListViewCryptos extends StatelessWidget {
  final List<CryptoViewData> data;
  final List<double> singleBalance;
  const ListViewCryptos({
    Key? key,
    required this.data,
    required this.singleBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      itemCount: data.length,
      separatorBuilder: (context, index) => const Divider(thickness: 1),
      itemBuilder: (context, index) {
        CryptoViewData crypto = data[index];
        return ListTitleCrypto(
          crypto: crypto,
          cryptoBalance: singleBalance[index],
        );
      },
    );
  }
}
