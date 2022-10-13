import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_crypto/details/repository/market_data_repository.dart';
import 'package:projeto_crypto/details/usecase/cryptos_market_data_usecase.dart';
import 'package:projeto_crypto/shared/api/models/endpoints/cryptos_endpoint.dart';

import '../../shared/api_factory.dart';
import 'crypto_list_mocktail_test.dart';

void main() {
  final dio = DioMock();
  final endpoint = CryptosEndpoint(dio);
  final repo = MarketDataRepository(endpoint);
  final usecase = CryptosMarketDataUsecase(repo);

  test("WHEN test endpoint THEN return a list of cryptos prices", () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(ApiFactory.getAllPrices()),
        requestOptions: RequestOptions(path: '')));
    final list = await usecase.execute('bitcoin');
    expect(list.prices[0], [1633046400000, 238735.1279439887]);
  });
}
