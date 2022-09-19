import 'package:crypto/portifolio/model/crypto_model_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class GraphicCryptoRepository {
  final Dio dio;

  GraphicCryptoRepository(this.dio);

  Future<Response> getDaysData(
    CryptoModelApi cryptoModelApi,
    int days,
  ) async {
    String id = cryptoModelApi.id;
    String currency = 'usd';
    final response = await dio.get(
        "https://api.coingecko.com/api/v3/coins/bitcoin/ohlc?vs_currency=usd&days=90",
        queryParameters: {'id': id, 'vs_currency': currency, 'days': days});
    debugPrint(response.toString());
    return response;
  }
}
