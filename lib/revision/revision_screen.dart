import 'package:flutter/material.dart';

import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/revision/widgets/row_revision_info.dart';
import 'package:projeto_crypto/revision/widgets/user_text_revision.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';
import 'package:projeto_crypto/shared/utils/app_bar_default.dart';

class RevisionScreen extends StatelessWidget {
  static const route = '/revision';
  CryptoViewData crypto;
  double singleBalance;

  RevisionScreen({
    Key? key,
    required this.crypto,
    required this.singleBalance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as AppArguments;
    return Scaffold(
      appBar: const AppBarDefault(title: 'Revisar'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const UserTextRevision(),
            const Divider(thickness: 1),
            RowRevisionInfo(label: 'Converter', data: '0.00000 BTC'),
            const Divider(thickness: 1),
            RowRevisionInfo(label: 'Receber', data: '0.09 ETH'),
            const Divider(thickness: 1),
            RowRevisionInfo(label: 'Câmbio', data: '1 BTC = 11.77 ETH'),
            const SizedBox(height: 10),
            // ButtonDefaulApp(

            //   label: 'Concluir conversão',
            //   route: '/revision',
            // ),
          ],
        ),
      ),
    );
  }
}
