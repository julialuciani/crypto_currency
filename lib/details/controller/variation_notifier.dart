import 'package:crypto/shared/models/crypto_model.dart';
import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var variationProvider = StateNotifierProvider<VariationNotifier, double>(
  (ref) => VariationNotifier(),
);

class VariationNotifier extends StateNotifier<double> {
  VariationNotifier() : super(0.0);

  void variationInDays(int days, CryptoModel crypto) {
    double variation = 0.0;
    days = days == 1 ? 2 : days;
    variation = (crypto.priceInNinety.first.toDouble() /
                crypto.priceInNinety[days - 1].toDouble() -
            1) *
        100;
    state = variation;
  }
}

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
