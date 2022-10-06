import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

import '../controller/cryptos_provider.dart';
import 'button_change_coin.dart';
import 'list_tile_conversion.dart';

class BodyConversionScreen extends StatefulHookConsumerWidget {
  CryptoViewData crypto;
  final List<CryptoViewData> data;

  BodyConversionScreen({
    Key? key,
    required this.crypto,
    required this.data,
  }) : super(key: key);

  @override
  ConsumerState<BodyConversionScreen> createState() =>
      _BodyConversionScreenState();
}

class _BodyConversionScreenState extends ConsumerState<BodyConversionScreen> {
  @override
  Widget build(BuildContext context) {
    var crypto = ref.watch(singleCryptoProvider.state).state;
    return ButtonChangeCoin(
      crypto: crypto,
      data: widget.data,
      listView: ListView.separated(
        separatorBuilder: (context, index) => const Divider(thickness: 1),
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                ref.read(singleCryptoProvider.state).state = widget.data[index];
              });
              Navigator.pop(context);
            },
            child: ListTileConversion(
              name: widget.data[index].name,
              symbol: widget.data[index].symbol.toUpperCase(),
            ),
          );
        },
      ),
    );
  }
}
