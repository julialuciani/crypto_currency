import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';
import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

import 'crypto_mock_data.dart';

class FakeRepository {
  static Future<List<CryptoViewData>> getAllCryptos() async {
    Future<List<CryptoViewData>> allCryptos = Future.delayed(Duration.zero, () {
      return [crypto, cryptoSecond];
    });
    return allCryptos;
  }

  static Future<CryptosMarkeDataViewData> getAllMarketData(String id) async {
    Future<CryptosMarkeDataViewData> allPrices =
        Future.delayed(Duration.zero, () {
      return CryptosMarkeDataViewData([
        [5, 3, 5],
        [5, 3, 5],
        [5, 3, 5],
        [5, 3, 5],
        [5, 3, 5],
        [5, 3, 5]
      ]);
    });
    return allPrices;
  }
}
