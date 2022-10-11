import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/details/methods/details_methods.dart';
import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';

void main() {
  test(
      'WHEN the numbers are the same THEN returns grey, when the numbers are different THEN returns transparent',
      () async {
    Color change = DetailsMethods.changeButtonColor(5, 5);
    expect(change, Colors.grey.shade300);

    Color changeSecond = DetailsMethods.changeButtonColor(15, 50);
    expect(changeSecond, Colors.transparent);
  });

  test('WHEN receives the list of prices THEN returns the variation of them',
      () async {
    double getVariation =
        DetailsMethods.getVariation(CryptosMarkeDataViewData(prices), 2);
    expect(getVariation, 0.0);
  });
}

List<List<num>> prices = [
  [2, 3],
  [2, 3],
  [2, 3],
];
