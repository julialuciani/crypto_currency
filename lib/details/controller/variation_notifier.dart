import 'package:crypto/shared/models/crypto_model.dart';
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
