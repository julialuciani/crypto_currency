import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/revision/methods/revision_methods.dart';

import '../../helpers/crypto_mock_data.dart';

void main() {
  test('Testing Conversion from One', () async {
    String getConvertion = RevisionMethods.getConvertionFromOne(crypto, crypto);
    expect(getConvertion, '1 BTC = 1.00000 BTC');
  });
}
