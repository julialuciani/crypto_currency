import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../portifolio/model/crypto_model_api.dart';

var cryptoApiProvider = StateNotifierProvider<CryptoNotifier, CryptoModelApi>(
  (ref) => CryptoNotifier(),
);

class CryptoNotifier extends StateNotifier<CryptoModelApi> {
  CryptoNotifier()
      : super(
          CryptoModelApi(
            id: 's',
            name: 's',
            currentPrice: 0,
            image: 's',
            symbol: 's',
            priceChangeOneDay: 0,
          ),
        );
}
