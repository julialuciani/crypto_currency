import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/shared/api/models/cryptos/cryptos_response.dart';

void main() {
  test('When cryptos response .toJson then confirm expectations', () async {
    CryptosResponse cryptosResponse = CryptosResponse('', '', '', '', 1, 2);
    debugPrint(cryptosResponse.toJson().toString());
    expect(cryptosResponse.toJson(), {
      'id': '',
      'symbol': '',
      'name': '',
      'image': '',
      'current_price': 1.0,
      'price_change_percentage_24h': 2.0
    });
  });
}
