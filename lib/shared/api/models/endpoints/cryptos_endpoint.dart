import 'package:dio/dio.dart';
import 'dart:io';

class CryptosEndpoint {
  final Dio _dio;
  final String currency = Platform.localeName == 'pt-BR' ? 'brl' : 'usd';
  CryptosEndpoint(this._dio);

  Future<Response> getAllCryptos() async {
    return await _dio.get(
        '/coins/markets?vs_currency=$currency&order=market_cap_desc&per_page=100&page=1&sparkline=false');
  }

  Future<Response> getAllCryptosMarketData(String id) async {
    return await _dio.get(
        '/coins/$id/market_chart?vs_currency=$currency&days=365&interval=daily');
  }
}
