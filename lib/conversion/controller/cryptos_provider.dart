import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

var rightCryptoProvider = StateProvider<CryptoViewData>((ref) => CryptoViewData(
      id: 'bitcoin',
      symbol: 'btc',
      name: 'Bitcoin',
      image:
          'https://w7.pngwing.com/pngs/698/439/png-transparent-bitcoin-cryptocurrency-logo-bitcoin-text-orange-logo.png',
      currentPrice: 0.0,
      variation: 0.0,
    ));
var leftCryptoProvider = StateProvider<CryptoViewData>((ref) => CryptoViewData(
      id: 'bitcoin',
      symbol: 'btc',
      name: 'Bitcoin',
      image:
          'https://w7.pngwing.com/pngs/698/439/png-transparent-bitcoin-cryptocurrency-logo-bitcoin-text-orange-logo.png',
      currentPrice: 0.0,
      variation: 0.0,
    ));
