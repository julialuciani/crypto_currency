import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/portifolio/controller/balance_provider.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/portifolio/usecase/cryptos_provider.dart';
import 'listile_crypto.dart';

class ListViewCryptos extends HookConsumerWidget {
  const ListViewCryptos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cryptos = ref.read(cryptosProvider);
    return cryptos.when(
      data: (data) => Expanded(
        child: ListView.separated(
          physics: const ClampingScrollPhysics(),
          itemCount: data.length,
          separatorBuilder: (context, index) => const Divider(thickness: 1),
          itemBuilder: (context, index) {
            CryptoViewData crypto = data[index];
            ref.read(balanceProvider.notifier).getBalance(data);
            return ListTitleCrypto(
              crypto: crypto,
            );
          },
        ),
      ),
      error: (e, r) {
        debugPrint('E: $e');
        debugPrint('R: $r');
        return const Text('Erro');
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
