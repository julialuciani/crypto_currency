import 'package:crypto/shared/models/crypto_model.dart';
import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/utils/decimal_to_double.dart';

var cryptoProvider = StateNotifierProvider<CryptoNotifier, CryptoModel>(
  (ref) => CryptoNotifier(),
);

class CryptoNotifier extends StateNotifier<CryptoModel> {
  CryptoNotifier()
      : super(CryptoModel(
            id: 1,
            name: 's',
            howMuchUserHave: Decimal.parse('1'),
            quantity: Decimal.parse('1'),
            variation: 0,
            currentPrice: Decimal.parse('1'),
            iconImage: 's',
            priceInOne: [Decimal.parse('0')],
            priceInNinety: [Decimal.parse('0')],
            abbreviation: 'k'));

  void variationInDays(int days) {
    days = days == 1 ? 2 : days;
    state.variation = (DT.dt(state.priceInNinety.first) /
                DT.dt(state.priceInNinety[days - 1]) -
            1) *
        100;
  }
}
