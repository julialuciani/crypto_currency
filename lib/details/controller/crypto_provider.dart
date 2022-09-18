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
            id: 0,
            name: '',
            abbreviation: '',
            howMuchUserHave: Decimal.parse('1'),
            quantity: Decimal.parse('1'),
            variation: 0,
            currentPrice: Decimal.parse('1'),
            iconImage: '',
            priceInOne: [Decimal.parse('0')],
            priceInNinety: [Decimal.parse('0')]));

  void variationInDays(int days) {
    days = days == 1 ? 2 : days;
    state.variation = (DT.dt(state.priceInNinety.first) /
                DT.dt(state.priceInNinety[days - 1]) -
            1) *
        100;
  }
}
