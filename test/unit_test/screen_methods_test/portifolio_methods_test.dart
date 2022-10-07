import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/portifolio/methods/portifolio_methods.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

import '../../helpers/crypto_mock_data.dart';

void main() {
  test('Testing portifolio methods', () async {
    double getBalance = PortifolioMethods.getBalance(data, single);
    expect(getBalance, 20);
  });
}

List<CryptoViewData> data = [crypto, crypto];
List<double> single = [5, 5];
