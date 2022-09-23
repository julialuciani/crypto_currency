import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/portifolio/usecase/cryptos_provider.dart';

class ButtonChangeCoin extends HookConsumerWidget {
  final dynamic image;
  final String abbreviation;
  final List? cryptos;
  const ButtonChangeCoin({
    Key? key,
    required this.image,
    required this.abbreviation,
    required this.cryptos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cryptos = ref.watch(cryptosProvider);

    return cryptos.when(
      data: (data) {
        return MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(color: Colors.grey.shade300)),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                elevation: 2,
                backgroundColor: Colors.white,
                content: SizedBox(
                  height: 200,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const Divider(thickness: 1),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: const ListTile(
                          title: Text('ETH'),
                          subtitle: Text('Ethereum'),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(
                  image,
                ),
              ),
              const SizedBox(width: 8),
              Text(abbreviation),
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
