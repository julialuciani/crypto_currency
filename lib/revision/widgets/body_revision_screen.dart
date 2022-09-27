import 'package:flutter/material.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/revision/widgets/row_revision_info.dart';
import 'package:projeto_crypto/revision/widgets/user_text_revision.dart';

import '../../shared/templates/button_default_app.dart';

class BodyRevision extends StatelessWidget {
  String convertQuantiy;
  String receiveQuantity;
  CryptoViewData cryptoConvert;
  CryptoViewData cryptoReceive;
  BodyRevision({
    Key? key,
    required this.convertQuantiy,
    required this.receiveQuantity,
    required this.cryptoConvert,
    required this.cryptoReceive,
    required this.route,
  }) : super(key: key);

  final String route;

  String getConvertionFromOne() {
    double total = cryptoConvert.currentPrice / cryptoReceive.currentPrice;
    debugPrint(total.toString());
    return total.toStringAsFixed(4);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const UserTextRevision(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Divider(thickness: 1),
                RowRevisionInfo(
                    label: 'Converter',
                    data:
                        '$convertQuantiy ${cryptoConvert.symbol.toUpperCase()}'),
                const Divider(thickness: 1),
                RowRevisionInfo(label: 'Receber', data: receiveQuantity),
                const Divider(thickness: 1),
                RowRevisionInfo(
                    label: 'Câmbio',
                    data:
                        '1 ${cryptoConvert.symbol.toUpperCase()} = $getConvertionFromOne'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ButtonDefaulApp(route: route, label: 'Concluir conversão')
        ],
      ),
    );
  }
}
