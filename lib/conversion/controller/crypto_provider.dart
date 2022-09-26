import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

var cryptoProvider = StateProvider((ref) => CryptoViewData(
      id: 'bitcoin',
      symbol: 'btc',
      name: 'Bitcoin',
      image: 'https://bitcoin.org/img/icons/opengraph.png?1662473327',
      currentPrice: 0.0,
      variation: 0.0,
    ));
