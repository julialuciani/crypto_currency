import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

var singleCryptoProvider =
    StateProvider<CryptoViewData>((ref) => CryptoViewData(
          id: 'bitcoin',
          symbol: 'btc',
          name: 'Bitcoin',
          image: 'assets/icons/cent.png',
          currentPrice: 0.0,
          variation: 0.0,
        ));
