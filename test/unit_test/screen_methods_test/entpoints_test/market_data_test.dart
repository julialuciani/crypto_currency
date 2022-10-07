import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_crypto/shared/api/models/endpoints/cryptos_endpoint.dart';

import '../../../shared/api_factory.dart';
import 'crypto_list_mocktail_test.dart';

void main() {
  late Response<Map<String, dynamic>> sucess;
  late DioMock dioMock;
  late CryptosEndpoint cryptosEndpoint;

  When mockGetResponse() => when(() => dioMock.get(any()));

  mockResponse(Map<String, dynamic> factory, int statusCode) => Response(
      data: factory,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: faker.internet.httpUrl()));

  setUp(() {
    dioMock = DioMock();
    cryptosEndpoint = CryptosEndpoint(dioMock);
  });

  setUp(() {
    sucess = mockResponse(ApiFactory.getAllPrices(), 200);
  });

  test("Must return a list o MarketData about cryptos", () async {
    mockGetResponse().thenAnswer((_) async => sucess);
    final result = await cryptosEndpoint.getAllCryptosMarketData('bitcoin');
    expect(result.statusCode, equals(200));
    expect(result, sucess);
  });
}
