import 'package:flutter/material.dart';

import 'package:projeto_crypto/revision/widgets/button_revision_screen.dart';
import 'package:projeto_crypto/revision/widgets/column_revision_infos.dart';
import 'package:projeto_crypto/revision/widgets/user_text_revision.dart';

import '../../portfolio/model/crypto_view_data.dart';

class BodyRevision extends StatelessWidget {
  final double convertQuantity;
  final double receiveQuantity;
  final CryptoViewData cryptoConvert;
  final CryptoViewData cryptoReceive;
  final List<CryptoViewData> cryptos;
  const BodyRevision({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.cryptoConvert,
    required this.cryptoReceive,
    required this.cryptos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const UserTextRevision(),
          const Spacer(),
          ColumnRevisionInfo(
            convertQuantity: convertQuantity,
            cryptoConvert: cryptoConvert,
            receiveQuantity: receiveQuantity,
            cryptoReceive: cryptoReceive,
          ),
          const SizedBox(height: 30),
          ButtonRevisionScreen(
            cryptoConvert: cryptoConvert,
            cryptoReceive: cryptoReceive,
            convertQuantity: convertQuantity,
            receiveQuantity: receiveQuantity,
            cryptos: cryptos,
          ),
        ],
      ),
    );
  }
}
