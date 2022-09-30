import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

class ButtonChangeCoin extends HookConsumerWidget {
  final CryptoViewData crypto;
  final List<CryptoViewData> data;
  final Widget listView;

  const ButtonChangeCoin({
    Key? key,
    required this.crypto,
    required this.data,
    required this.listView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      onPressed: () {
        modalBottomSheetCryptosList(context);
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.transparent,
            child: Image.network(
              crypto.image,
              scale: 8,
            ),
          ),
          const SizedBox(width: 8),
          Text(crypto.symbol.toUpperCase()),
          const SizedBox(width: 2),
          const Icon(Icons.expand_more),
        ],
      ),
    );
  }

  Future<dynamic> modalBottomSheetCryptosList(BuildContext context) {
    return showModalBottomSheet(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
  }
}
