import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:projeto_crypto/l10n/core_strings.dart';
import 'package:projeto_crypto/movements/model/movement_model.dart';
import 'package:projeto_crypto/shared/controller/movement_provider.dart';
import 'package:projeto_crypto/shared/style/colors.dart';

import '../../portfolio/controller/crypto_individual_balance_notifier.dart';
import '../../portfolio/model/crypto_view_data.dart';

class ButtonRevisionScreen extends HookConsumerWidget {
  final double convertQuantity;
  final double receiveQuantity;
  final CryptoViewData cryptoConvert;
  final CryptoViewData cryptoReceive;

  final List<CryptoViewData> cryptos;
  const ButtonRevisionScreen({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.cryptoConvert,
    required this.cryptoReceive,
    required this.cryptos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movements = ref.watch(movementProvider.state).state;

    MovementModel model = MovementModel(
        converted: '$convertQuantity ${cryptoConvert.symbol.toUpperCase()}',
        received: '$receiveQuantity ${cryptoReceive.symbol.toUpperCase()}',
        date: DateTime.now(),
        increase: receiveQuantity,
        discount: convertQuantity,
        idDiscount: cryptoConvert.id,
        idIncrease: cryptoReceive.id,
        valueInReal:
            NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
                .format(convertQuantity * cryptoConvert.currentPrice));

    void alterBalance() {
      Future.delayed(Duration.zero, () {
        int discountIndex =
            cryptos.indexWhere((element) => model.idDiscount == element.id);
        int increaseIndex =
            cryptos.indexWhere((element) => model.idIncrease == element.id);

        for (CryptoViewData crypto in cryptos) {
          if (model.idDiscount == crypto.id) {
            ref.read(singleBalanceProvider)[discountIndex] -= model.discount;
          } else if (model.idIncrease == crypto.id) {
            ref.read(singleBalanceProvider)[increaseIndex] += model.increase;
          }
        }
      });
    }

    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: magenta,
      onPressed: () {
        Navigator.pushNamed(context, '/conversion-performed');
        movements.add(model);
        alterBalance();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Text(
          CoreString.of(context)!.conv,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
