import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:projeto_crypto/portifolio/repository/cryptos_repository.dart';
import 'package:projeto_crypto/portifolio/usecase/cryptos_usecase.dart';
import 'package:projeto_crypto/shared/api/models/endpoints/cryptos_endpoint.dart';

import '../../shared/api_factory.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final endpoint = CryptosEndpoint(dio);
  final repo = CryptosRepository(endpoint);
  final usecase = CryptosUsecase(repo);

  test('Must return a list of Cryptos', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
        data: jsonDecode(ApiFactory.getAllCryptos()),
        requestOptions: RequestOptions(path: '')));
    final list = await usecase.execute();
    expect(list[0].id, 'bitcoin');
  });
}