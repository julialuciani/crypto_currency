import 'package:flutter/material.dart';
import 'package:projeto_crypto/l10n/core_strings.dart';

import 'package:projeto_crypto/revision/widgets/row_revision_info.dart';

import '../../portfolio/model/crypto_view_data.dart';
import '../methods/revision_methods.dart';

class ColumnRevisionInfo extends StatelessWidget {
  const ColumnRevisionInfo({
    Key? key,
    required this.convertQuantity,
    required this.cryptoConvert,
    required this.receiveQuantity,
    required this.cryptoReceive,
  }) : super(key: key);

  final double convertQuantity;
  final CryptoViewData cryptoConvert;
  final double receiveQuantity;
  final CryptoViewData cryptoReceive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(thickness: 1),
        RowRevisionInfo(
          label: CoreString.of(context)!.convert,
          data: '$convertQuantity ${cryptoConvert.symbol.toUpperCase()}',
        ),
        const Divider(thickness: 1),
        RowRevisionInfo(
            label: CoreString.of(context)!.receive,
            data: '$receiveQuantity ${cryptoReceive.symbol.toUpperCase()}'),
        const Divider(thickness: 1),
        RowRevisionInfo(
          label: CoreString.of(context)!.exc,
          data: RevisionMethods.getConvertionFromOne(
              cryptoConvert, cryptoReceive),
        ),
      ],
    );
  }
}
