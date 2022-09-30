import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/movements/view/model/movement_model.dart';
import 'package:projeto_crypto/portifolio/usecase/cryptos_provider.dart';
import 'package:projeto_crypto/shared/controller/movement_provider.dart';
import 'package:projeto_crypto/shared/style/colors.dart';
import 'package:projeto_crypto/shared/templates/error_body.dart';
import 'package:projeto_crypto/shared/templates/loading_body.dart';

import '../../portifolio/controller/crypto_individual_balance_notifier.dart';
import '../../portifolio/model/crypto_view_data.dart';

class ButtonRevisionScreen extends HookConsumerWidget {
  final String convertQuantity;
  final String receiveQuantity;
  final CryptoViewData cryptoConvert;
  final CryptoViewData cryptoReceive;
  final String total;
  final double discount;
  final double increase;
  final String idDiscount;
  final String idIncrease;
  const ButtonRevisionScreen({
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
  Widget build(BuildContext context, WidgetRef ref) {
    final movements = ref.watch(movementProvider.state).state;
    final cryptos = ref.watch(cryptosProvider);
    MovementModel model = MovementModel(
      converted: '$convertQuantity ${cryptoConvert.symbol.toUpperCase()}',
      received: receiveQuantity,
      valueInReal: total,
      date: DateTime.now(),
      increase: increase,
      discount: discount,
      idDiscount: idDiscount,
      idIncrease: idIncrease,
    );

    return cryptos.when(
      data: (data) {
        void alterBalance() {
          Future.delayed(Duration.zero, () {
            for (CryptoViewData crypto in data) {
              if (model.idDiscount == crypto.id) {
                ref
                    .read(singleBalanceProvider.notifier)
                    .state[data.indexOf(crypto)] -= model.discount;
              } else if (model.idIncrease == crypto.id) {
                ref
                    .read(singleBalanceProvider.notifier)
                    .state[data.indexOf(crypto)] += model.increase;
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
      },
      error: (error, stackTrace) {
        return ErrorBody(onError: () {
          ref.refresh(cryptosProvider);
        });
      },
      loading: () {
        return const LoadingBody();
      },
    );
  }
}
