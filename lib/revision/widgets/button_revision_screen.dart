import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/movements/view/model/movement_model.dart';
import 'package:projeto_crypto/shared/controller/movement_provider.dart';
import 'package:projeto_crypto/shared/style/colors.dart';

import '../../portifolio/model/crypto_view_data.dart';

class ButtonRevisionScreen extends HookConsumerWidget {
  final String convertQuantity;
  final String receiveQuantity;
  final CryptoViewData cryptoConvert;
  final CryptoViewData cryptoReceive;
  final String total;
  const ButtonRevisionScreen({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.cryptoConvert,
    required this.cryptoReceive,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var movements = ref.watch(movementProvider.state).state;

    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: magenta,
      onPressed: () {
        Navigator.pushNamed(context, '/conversion-performed');
        movements.add(
          MovementModel(
            converted: '$convertQuantity ${cryptoConvert.symbol.toUpperCase()}',
            received: receiveQuantity,
            valueInReal: total,
            date: DateTime.now(),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Text(
          'Concluir conversão',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
