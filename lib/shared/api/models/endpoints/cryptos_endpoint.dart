import 'package:dio/dio.dart';

class CryptosEndpoint {
  final Dio _dio;

  CryptosEndpoint(this._dio);

  Future<Response> getAllCryptos() async {
    return await _dio.get(
        '/coins/markets?vs_currency=brl&order=market_cap_desc&per_page=100&page=1&sparkline=false');
  }

  Future<Response> getAllCryptosMarketData(String id) async {
    return await _dio
        .get('/coins/$id/market_chart?vs_currency=brl&days=366&interval=daily');
  }
}
