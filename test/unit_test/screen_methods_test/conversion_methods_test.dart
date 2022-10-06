import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/conversion/methods/conversion_methods.dart';

import '../../helpers/crypto_mock_data.dart';

void main() {
  test('Testing if method formattingValue works', () async {
    expect(ConversionMethods.formattingValue('0,2'), '0.2');
  });

  test('Testing  if isCorrect works', () async {
    expect(ConversionMethods.isCorrect('.1'), false);
    expect(ConversionMethods.isCorrect('-1'), false);
    expect(ConversionMethods.isCorrect('+1'), false);
    expect(ConversionMethods.isCorrect(',1'), false);
    expect(ConversionMethods.isCorrect('0.1'), true);
  });

  test('Testing convert Latest Value', () async {
    String valueController = '5';

    double convert =
        ConversionMethods.convertLatestValue(valueController, crypto);
    expect(convert, 10);

    String valueControllerSecond = '';

    double convertSecond =
        ConversionMethods.convertLatestValue(valueControllerSecond, crypto);
    expect(convertSecond, 0);

    String valueControllerThird = '.';

    double convertThird =
        ConversionMethods.convertLatestValue(valueControllerThird, crypto);
    expect(convertThird, 0);
  });

  test('Format latest value', () async {
    String formatLatest = ConversionMethods.formatLatestValue(50.0);
    if (Platform.localeName == 'pt-BR') {
      expect(formatLatest, 'R\$ 50,00');
    }
    expect(formatLatest, '\$50.00');
  });
}
