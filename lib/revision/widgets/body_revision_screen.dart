import 'package:flutter/material.dart';
import 'package:projeto_crypto/revision/widgets/button_revision_screen.dart';
import 'package:projeto_crypto/revision/widgets/column_revision_infos.dart';

import 'package:projeto_crypto/revision/widgets/user_text_revision.dart';

import '../../portifolio/model/crypto_view_data.dart';

class BodyRevision extends StatelessWidget {
  final String convertQuantity;
  final String receiveQuantity;
  final CryptoViewData cryptoConvert;
  final CryptoViewData cryptoReceive;
  const BodyRevision({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.cryptoConvert,
    required this.cryptoReceive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const UserTextRevision(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          ColumnRevisionInfo(
            convertQuantity: convertQuantity,
            cryptoConvert: cryptoConvert,
            receiveQuantity: receiveQuantity,
            cryptoReceive: cryptoReceive,
          ),
          const SizedBox(height: 20),
          const ButtonRevisionScreen(),
        ],
      ),
    );
  }
}
