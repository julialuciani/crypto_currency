import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

var cryptoProvider = StateNotifierProvider<CryptoNotifier, CryptoViewData>(
  (ref) => CryptoNotifier(),
);

class CryptoNotifier extends StateNotifier<CryptoViewData> {
  CryptoNotifier()
      : super(
          CryptoViewData(
            id: 's',
            name: 's',
            currentPrice: 0,
            image: 's',
            symbol: 's',
            variation: 0,
          ),
        );
}
