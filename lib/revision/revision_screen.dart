import 'package:flutter/material.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

import 'package:projeto_crypto/revision/revision_arguments/revision_arguments.dart';
import 'package:projeto_crypto/revision/widgets/body_revision_screen.dart';
import 'package:projeto_crypto/shared/utils/app_bar_default.dart';

class RevisionScreen extends StatelessWidget {
  static const route = '/revision';
  String convertQuantity;
  String receiveQuantity;
  CryptoViewData cryptoConvert;
  CryptoViewData cryptoReceive;

  RevisionScreen({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.cryptoConvert,
    required this.cryptoReceive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RevisionArguments;
    return Scaffold(
      appBar: const AppBarDefault(title: 'Revisar'),
      body: BodyRevision(
        route: route,
        cryptoConvert: args.cryptoConvert,
        cryptoReceive: args.cryptoReceive,
        convertQuantiy: args.convertQuantity,
        receiveQuantity: args.receiveQuantity,
      ),
    );
  }
}
