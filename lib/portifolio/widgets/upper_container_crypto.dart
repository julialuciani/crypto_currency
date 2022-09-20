import 'package:crypto/portifolio/controller/crypto_list_provider_api.dart';
import 'package:crypto/portifolio/controller/quantity_provider.dart';
import 'package:crypto/portifolio/widgets/container_visible.dart';
import 'package:crypto/shared/models/crypto_model.dart';
import 'package:crypto/shared/utils/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/style/colors.dart';
import '../controller/visibility_provider.dart';

class UpperContainerCrypto extends StatefulHookConsumerWidget {
  const UpperContainerCrypto({super.key});

  @override
  ConsumerState<UpperContainerCrypto> createState() => _UpperCardCryptoState();
}

late CryptoModel cryptoModel;

class _UpperCardCryptoState extends ConsumerState<UpperContainerCrypto> {
  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibilityProvider.state);
    var balance = ref.watch(balanceProvider.state);
    ref.read(listCryptosProvider.notifier).getAllCryptos();

    return Container(
      height: 165,
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Cripto',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: magenta,
                  fontFamily: 'Montserrat',
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    visible.state = !visible.state;
                  });
                },
                icon: Icon(
                    visible.state ? Icons.visibility : Icons.visibility_off),
              ),
            ],
          ),
          visible.state
              ? Text(
                  FormatCurrency.formatDouble(balance.state),
                  style: const TextStyle(
                    fontSize: 29,
                    fontFamily: 'Montserrat',
                  ),
                )
              : const InvisibleContainer(),
          const SizedBox(height: 5),
          Text(
            'Valor total de moedas',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
