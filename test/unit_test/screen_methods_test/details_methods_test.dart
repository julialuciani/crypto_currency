import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/details/methods/details_methods.dart';
import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';

void main() {
  test(
      'When the numbers are the same then returns grey, when the numbers are different then returns transparente',
      () async {
    Color change = DetailsMethods.changeButtonColor(5, 5);
    expect(change, Colors.grey.shade300);

    Color changeSecond = DetailsMethods.changeButtonColor(15, 50);
    expect(changeSecond, Colors.transparent);
  });

  test('When receives the list of prices then returns the variation of them',
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
