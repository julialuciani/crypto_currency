import 'package:crypto/portifolio/model/crypto_model_api.dart';
import 'package:dio/dio.dart';

class CryptoRepository {
  final Dio dio;

  CryptoRepository(this.dio);

  Future<List<CryptoModelApi>> getAllCryptos() async {
    List<CryptoModelApi> cryptos = [];
    final response = await dio.get(
      "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false",
    );

    cryptos = List.from(
      response.data.map(
        (crypto) {
          return CryptoModelApi.fromMap(crypto);
        },
      ),
    );

    return cryptos;
  }
}
