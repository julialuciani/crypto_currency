import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/revision/methods/revision_methods.dart';
import 'package:projeto_crypto/revision/revision_arguments/revision_arguments_screen.dart';

import '../../helpers/crypto_mock_data.dart';

void main() {
  test(
      'WHEN receives the cryptos THEN return the convertion of one to how much the other has value compared to',
      () async {
    String getConvertion = RevisionMethods.getConvertionFromOne(crypto, crypto);
    expect(getConvertion, '1 BTC = 1.00000 BTC');
  });

  test('WHEN receive the parameters THEN tests if they are equal', () async {
    RevisionArguments revisionArguments = RevisionArguments(
        convertQuantity: '1BTC',
        receiveQuantity: '2 ETH',
        cryptoConvert: crypto,
        cryptoReceive: cryptoSecond,
        total: '100',
        discount: 1,
        increase: 2,
        idDiscount: 'btc',
        idIncrease: 'eth',
        cryptos: [crypto, cryptoSecond]);

    expect(revisionArguments.convertQuantity, '1BTC');
    expect(revisionArguments.receiveQuantity, '2 ETH');
    expect(revisionArguments.cryptoConvert, crypto);
    expect(revisionArguments.cryptoReceive, cryptoSecond);
    expect(revisionArguments.total, '100');
    expect(revisionArguments.discount, 1);
    expect(revisionArguments.increase, 2);
    expect(revisionArguments.idDiscount, 'btc');
    expect(revisionArguments.idIncrease, 'eth');
  });
}
