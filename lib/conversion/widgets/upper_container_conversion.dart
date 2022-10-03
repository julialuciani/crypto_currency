import 'package:flutter/material.dart';
import 'package:projeto_crypto/l10n/core_strings.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

class UpperAvailableBalanceContainer extends StatelessWidget {
  CryptoViewData crypto;
  double singleBalance;
  UpperAvailableBalanceContainer({
    Key? key,
    required this.crypto,
    required this.singleBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 245, 245, 250),
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            CoreString.of(context)!.avai,
            style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
          ),
          Text(
            '${singleBalance.toStringAsFixed(5)} ${crypto.symbol.toUpperCase()}',
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
