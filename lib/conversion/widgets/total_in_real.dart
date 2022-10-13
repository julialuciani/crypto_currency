import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

import '../methods/conversion_methods.dart';

class TotalInReal extends StatelessWidget {
  const TotalInReal({
    Key? key,
    required this.valueController,
    required this.crypto,
  }) : super(key: key);

  final TextEditingController valueController;
  final CryptoViewData crypto;

  @override
  Widget build(BuildContext context) {
    return Text(
      NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2).format(
          ConversionMethods.convertLeftValueToReal(
              valueController.text, crypto)),
      style: TextStyle(
        fontSize: 20,
        color: Colors.grey.shade500,
      ),
    );
  }
}
