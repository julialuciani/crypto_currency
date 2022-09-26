import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/conversion/controller/crypto_provider.dart';

import 'package:projeto_crypto/portifolio/usecase/cryptos_provider.dart';

class ButtonChangeCoin extends StatefulHookConsumerWidget {
  final dynamic image;
  final String abbreviation;

  const ButtonChangeCoin({
    Key? key,
    required this.image,
    required this.abbreviation,
  }) : super(key: key);

  @override
  ConsumerState<ButtonChangeCoin> createState() => _ConversionState();
}

class _ConversionState extends ConsumerState<ButtonChangeCoin> {
  @override
  Widget build(BuildContext context) {
    var cryptos = ref.watch(cryptosProvider);

    return cryptos.when(
      data: (data) {
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
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const Divider(thickness: 1),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  ref.watch(cryptoProvider.state).state =
                                      data[index];
                                });
                              },
                              child: ListTile(
                                title: Text(data[index].symbol.toUpperCase()),
                                subtitle: Text(data[index].name),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                  color: Colors.grey.shade500,
                                ),
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
                radius: 16,
                backgroundImage: NetworkImage(
                  widget.image,
                ),
              ),
              const SizedBox(width: 8),
              Text(widget.abbreviation),
              const SizedBox(width: 2),
              const Icon(Icons.expand_more),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        debugPrint(stackTrace.toString());
        debugPrint(error.toString());
        return const Text('Deu erro');
      },
      loading: () {
        return const CircularProgressIndicator();
      },
    );
  }
}
