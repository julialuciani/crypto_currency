import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/conversion/controller/cryptos_provider.dart';

import 'package:projeto_crypto/l10n/core_strings.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

import 'list_tile_conversion.dart';

class ButtonChangeCoin extends ConsumerStatefulWidget {
  CryptoViewData crypto;
  final List<CryptoViewData> data;
  final String id;

  ButtonChangeCoin({
    Key? key,
    required this.crypto,
    required this.data,
    required this.id,
  }) : super(key: key);

  @override
  ConsumerState<ButtonChangeCoin> createState() => _ButtonChangeCoinState();
}

class _ButtonChangeCoinState extends ConsumerState<ButtonChangeCoin> {
  @override
  Widget build(BuildContext context) {
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, bottom: 15),
                        child: Text(
                          CoreString.of(context)!.pick,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 1),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const Divider(thickness: 1),
                      itemCount: widget.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (widget.id == '1') {
                                widget.crypto = widget.data[index];
                              } else if (widget.id != '1') {
                                ref.read(singleCryptoProvider.state).state =
                                    widget.data[index];
                              }
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
            radius: 15,
            backgroundColor: Colors.transparent,
            child: Image.network(
              widget.crypto.image,
              scale: 8,
            ),
          ),
          const SizedBox(width: 8),
          Text(widget.crypto.symbol.toUpperCase()),
          const SizedBox(width: 2),
          const Icon(Icons.expand_more),
        ],
      ),
    );
  }
}
