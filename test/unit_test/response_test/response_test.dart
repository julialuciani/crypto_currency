import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/shared/api/models/cryptos/cryptos_response.dart';
import 'package:projeto_crypto/shared/api/models/cryptos_market_data/market_data_response.dart';

void main() {
  test('WHEN cryptos response .toJson THEN confirm expectations', () {
    CryptosResponse cryptosResponse = CryptosResponse('', '', '', '', 1, 2);
    expect(cryptosResponse.toJson(), {
      'id': '',
      'symbol': '',
      'name': '',
      'image': '',
      'current_price': 1.0,
      'price_change_percentage_24h': 2.0
    });
  });

  test('WHEN market data response .toJson THEN confirm expectations', () {
    MarketDataResponse marketDataResponse = MarketDataResponse([
      [1.5, 1.3]
    ]);
    expect(marketDataResponse.toJson(), {
      "prices": [
        [1.5, 1.3]
      ]
    });
  });
}
