import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/crypto_model.dart';

class DetailsCryptoNotifier extends StateNotifier<CryptoModel> {
  DetailsCryptoNotifier()
      : super(
          CryptoModel(
            id: 0,
            name: '',
            abbreviation: '',
            howMuchUserHave: Decimal.parse('1'),
            quantity: Decimal.parse('1'),
            variation: 1.3,
            currentPrice: Decimal.parse('1'),
            iconImage: '1',
            priceInOne: [Decimal.parse('1')],
            priceInNinety: [Decimal.parse('1')],
          ),
        );

  void changeDetailsCrypto(CryptoModel model) {
    state = model;
  }
}
