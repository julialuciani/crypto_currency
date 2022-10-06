import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/details/methods/details_methods.dart';

void main() {
  test('ChartButton', () async {
    Color change = DetailsMethods.changeButtonColor(5, 5);
    expect(change, Colors.grey.shade300);

    Color changeSecond = DetailsMethods.changeButtonColor(15, 50);
    expect(changeSecond, Colors.transparent);
  });
}
