import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/portifolio/controller/balance_provider.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/portifolio/usecase/cryptos_provider.dart';
import 'package:projeto_crypto/shared/style/colors.dart';
import 'listile_crypto.dart';

class ListViewCryptos extends HookConsumerWidget {
  const ListViewCryptos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptos = ref.watch(cryptosProvider);

    return cryptos.when(
      data: (data) {
        Future.delayed(Duration.zero, () {
          double getBalance() {
            double balance = 0;
            for (CryptoViewData crypto in data) {
              balance += crypto.currentPrice * 0.5;
            }
            return balance;
          }

          ref.read(balanceProvider.state).state = getBalance();
        });
        return Expanded(
          child: ListView.separated(
            physics: const ClampingScrollPhysics(),
            itemCount: data.length,
            separatorBuilder: (context, index) => const Divider(thickness: 1),
            itemBuilder: (context, index) {
              CryptoViewData crypto = data[index];
              return ListTitleCrypto(
                crypto: crypto,
              );
            },
          ),
        );
      },
      error: (e, r) {
        debugPrint('E: $e');
        debugPrint('R: $r');
        return Column(
          children: const [
            SizedBox(height: 10),
            Text('Deu erro :('),
          ],
        );
      },
      loading: () {
        return Column(
          children: const [
            CircularProgressIndicator(
              color: magenta,
            ),
          ],
        );
      },
    );
  }
}
