import 'package:crypto/presenter/home_page/widgets/visible.dart';
import 'package:crypto/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../providers/visibility_provider.dart';

class UpperCardCrypto extends StatefulHookConsumerWidget {
  const UpperCardCrypto({super.key});

  @override
  ConsumerState<UpperCardCrypto> createState() => _UpperCardCryptoState();
}

class _UpperCardCryptoState extends ConsumerState<UpperCardCrypto> {
  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibilityProvider.state);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 45, bottom: 5),
      height: 150,
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
                  NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
                      .format(14798.00),
                  style: const TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const ContainerVisible(),
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
