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
  final String total;
  final double increase;
  final double discount;
  final String idDiscount;
  final String idIncrease;
  const BodyRevision({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.cryptoConvert,
    required this.cryptoReceive,
    required this.total,
    required this.increase,
    required this.discount,
    required this.idDiscount,
    required this.idIncrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const UserTextRevision(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.35),
          ColumnRevisionInfo(
            convertQuantity: convertQuantity,
            cryptoConvert: cryptoConvert,
            receiveQuantity: receiveQuantity,
            cryptoReceive: cryptoReceive,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ButtonRevisionScreen(
            convertQuantity: convertQuantity,
            cryptoConvert: cryptoConvert,
            receiveQuantity: receiveQuantity,
            cryptoReceive: cryptoReceive,
            total: total,
            discount: discount,
            increase: increase,
            idDiscount: idDiscount,
            idIncrease: idIncrease,
          ),
        ],
      ),
    );
  }
}
