import 'package:crypto/shared/models/crypto_model.dart';
import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VariationNotifier extends StateNotifier<CryptoModel> {
  VariationNotifier()
      : super(
          CryptoModel(
            id: 0,
            name: 'Bitcoin',
            abbreviation: 'BTC',
            howMuchUserHave: Decimal.parse('44'),
            quantity: Decimal.parse('555'),
            variation: 2,
            currentPrice: Decimal.parse('0'),
            iconImage: 'assets/icons/bitecoin.png',
            priceInNinety: [Decimal.parse('500')],
          ),
        );

  double variationInDays(int days, CryptoModel cryptoModel) {
    cryptoModel.variation = (cryptoModel.priceInNinety.first.toDouble() /
                cryptoModel.priceInNinety[days - 1].toDouble() -
            1) *
        100;
    return cryptoModel.variation;
  }
}
