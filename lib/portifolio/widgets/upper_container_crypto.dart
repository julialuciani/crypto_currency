import 'package:crypto/portifolio/widgets/visible.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/utils/design_system/colors.dart';
import '../../shared/utils/providers/visibility_provider.dart';

class UpperContainerCrypto extends StatefulHookConsumerWidget {
  const UpperContainerCrypto({super.key});

  @override
  ConsumerState<UpperContainerCrypto> createState() => _UpperCardCryptoState();
}

class _UpperCardCryptoState extends ConsumerState<UpperContainerCrypto> {
  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibilityProvider.state);
    return Container(
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
                  NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
                      .format(14798.00),
                  style: const TextStyle(
                    fontSize: 29,
                    fontFamily: 'Montserrat',
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
