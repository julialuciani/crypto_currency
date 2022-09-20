import 'package:dio/dio.dart';

class GraphicCryptoRepository {
  final Dio dio;

  GraphicCryptoRepository(this.dio);

  Future<List<double>> getDaysData(String id, int days) async {
    List<double> prices = [];
    final response = await dio.get(
        "https://api.coingecko.com/api/v3/coins/$id/ohlc?vs_currency=usd&days=$days");

    prices = List.from(response.data.map((price) {
      return price[4];
    }));

    return prices;
  }
}
