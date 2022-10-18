import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/l10n/core_strings.dart';

import '../../shared/style/colors.dart';
import '../../shared/utils/currency_formatter.dart';
import '../controller/balance_provider.dart';
import '../controller/visibility_provider.dart';
import 'invisible_container.dart';

class UpperContainerCrypto extends StatefulHookConsumerWidget {
  const UpperContainerCrypto({super.key});

  @override
  ConsumerState<UpperContainerCrypto> createState() => _UpperCardCryptoState();
}

class _UpperCardCryptoState extends ConsumerState<UpperContainerCrypto> {
  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibilityProvider.state);
    var balance = ref.watch(balanceProvider.state).state;

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
              Text(
                CoreString.of(context)!.crypto,
                style: const TextStyle(
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
              ? AutoSizeText(
                  FormatCurrency.format(balance),
                  style: const TextStyle(
                    fontSize: 29,
                    fontFamily: 'Montserrat',
                  ),
                )
              : const InvisibleContainer(),
          const SizedBox(height: 5),
          Text(
            CoreString.of(context)!.total,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
