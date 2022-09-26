import 'package:flutter/material.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

import '../style/colors.dart';

class ButtonDetailsScreen extends StatelessWidget {
  CryptoViewData crypto;
  ButtonDetailsScreen({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: magenta,
        onPressed: () {
          Navigator.pushNamed(context, '/conversion', arguments: crypto);
        },
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Converter Moeda',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
