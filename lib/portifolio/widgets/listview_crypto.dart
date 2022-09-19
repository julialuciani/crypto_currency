import 'package:crypto/portifolio/model/crypto_model_api.dart';
import 'package:crypto/portifolio/repositories/crypto_repository.dart';
import 'package:crypto/portifolio/widgets/listile_crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListViewCryptos extends StatefulHookConsumerWidget {
  const ListViewCryptos({Key? key}) : super(key: key);

  @override
  ConsumerState<ListViewCryptos> createState() => _ListViewCryptosState();
}

class _ListViewCryptosState extends ConsumerState<ListViewCryptos> {
  CryptoRepository repository = CryptoRepository(Dio());
  late Future<List<CryptoModelApi>> cryptos;

  @override
  void initState() {
    cryptos = repository.getAllCryptos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var cryptos = ref.watch(cryptosListProvider);

    return Expanded(
      child: FutureBuilder(
        future: cryptos,
        builder: (context, AsyncSnapshot<List<CryptoModelApi>> snapshot) {
          if (snapshot.hasData) {
            debugPrint(snapshot.data.toString());
            return ListView.separated(
              physics: const ClampingScrollPhysics(),
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) => const Divider(thickness: 1),
              itemBuilder: (context, index) {
                CryptoModelApi crypto = snapshot.data![index];
                return ListTitleCrypto(
                  crypto: crypto,
                );
              },
            );
          }
          return const Text('...');
        },
      ),
    );
  }
}
