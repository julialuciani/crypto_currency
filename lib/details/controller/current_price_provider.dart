import 'package:crypto/shared/models/crypto_model.dart';
import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var currrentPriceProvider =
    StateNotifierProvider<CurrentPriceNotifier, Decimal>(
  (ref) => CurrentPriceNotifier(),
);

class CurrentPriceNotifier extends StateNotifier<Decimal> {
  CurrentPriceNotifier() : super(Decimal.parse('0'));

  void getCurrentPrice(int days, CryptoModel crypto) {
    state = (crypto.priceInNinety[days - 1]);
  }
}
