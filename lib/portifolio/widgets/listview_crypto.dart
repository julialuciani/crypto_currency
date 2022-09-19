import 'package:crypto/portifolio/widgets/listile_crypto.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/crypto_model.dart';
import '../controller/crypto_list_provider.dart';

class ListViewCryptos extends HookConsumerWidget {
  const ListViewCryptos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cryptos = ref.watch(cryptosListProvider);

    return Expanded(
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        itemCount: cryptos.length,
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemBuilder: (context, index) {
          CryptoModel crypto = cryptos[index];
          return ListTitleCrypto(
            crypto: crypto,
          );
        },
      ),
    );
  }
}
