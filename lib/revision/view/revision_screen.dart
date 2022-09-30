import 'package:flutter/material.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/revision/revision_arguments/revision_arguments_screen.dart';
import 'package:projeto_crypto/revision/widgets/body_revision_screen.dart';
import 'package:projeto_crypto/shared/utils/app_bar_default.dart';

class RevisionScreen extends StatelessWidget {
  static const route = '/revision';
  String convertQuantity;
  String receiveQuantity;
  CryptoViewData cryptoConvert;
  CryptoViewData cryptoReceive;
  String total;
  double discount;
  double increase;
  String idDiscount;
  String idIncrease;

  RevisionScreen({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.cryptoConvert,
    required this.cryptoReceive,
    required this.total,
    required this.discount,
    required this.increase,
    required this.idDiscount,
    required this.idIncrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RevisionArguments;
    return Scaffold(
      appBar: const AppBarDefault(title: 'Revisar'),
      body: BodyRevision(
        convertQuantity: args.convertQuantity,
        cryptoConvert: args.cryptoConvert,
        cryptoReceive: args.cryptoReceive,
        receiveQuantity: args.receiveQuantity,
        total: args.total,
        increase: args.increase,
        discount: args.discount,
        idDiscount: args.idDiscount,
        idIncrease: args.idIncrease,
      ),
    );
  }
}
