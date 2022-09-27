import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/portifolio/usecase/cryptos_provider.dart';

class ButtonChangeCoin extends HookConsumerWidget {
  CryptoViewData crypto;
  List<CryptoViewData> data;
  Widget listView;

  ButtonChangeCoin({
    Key? key,
    required this.crypto,
    required this.data,
    required this.listView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cryptos = ref.watch(cryptosProvider);

    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      onPressed: () {
        showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          context: context,
          builder: (context) {
            return SizedBox(
              height: 300,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    height: 3,
                    width: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 15, bottom: 15),
                        child: Text(
                          'Escolha uma moeda para converter',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 1),
                  Expanded(
                    child: listView,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
              crypto.image,
            ),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(width: 8),
          Text(crypto.symbol.toUpperCase()),
          const SizedBox(width: 2),
          const Icon(Icons.expand_more),
        ],
      ),
    );
  }
}
