import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/portfolio/methods/portifolio_methods.dart';
import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

import '../../helpers/crypto_mock_data.dart';

void main() {
  test(
      'When receives the list of cryptos and the list of all their prices then takes the price of every single one according to both indexes',
      () async {
    double getBalance = PortifolioMethods.getBalance(data, single);
    expect(getBalance, 20);
  });
}

List<CryptoViewData> data = [crypto, crypto];
List<double> single = [5, 5];
