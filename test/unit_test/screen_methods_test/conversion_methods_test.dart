import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/conversion/methods/conversion_methods.dart';

import '../../helpers/crypto_mock_data.dart';

void main() {
  group('Testing conversion methods', () {
    test('When testing formattingValue then return a formatted value',
        () async {
      expect(ConversionMethods.formattingValue('0,2'), '0.2');
    });

    test('When a value starts with a special character then return false',
        () async {
      expect(ConversionMethods.isCorrect('.1'), false);
      expect(ConversionMethods.isCorrect('-1'), false);
      expect(ConversionMethods.isCorrect('+1'), false);
      expect(ConversionMethods.isCorrect(',1'), false);
      expect(ConversionMethods.isCorrect('0.1'), true);
    });

    test('When controller receives a value then convert this value', () async {
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

    test(
        'When receives value then formats value with the currency by the locale',
        () async {
      String formatLatest = ConversionMethods.formatLatestValue(50.0);
      if (Platform.localeName == 'pt-BR') {
        expect(formatLatest, 'R\$ 50,00');
      }
      expect(formatLatest, '\$50.00');
    });

    test(
        'When receives a value the returns the value divided by the current price of the crypto',
        () async {
      String getTotal = ConversionMethods.getTotal(crypto, 5);
      expect(getTotal, '2.5000000000 BTC');

      String getTotalSecond = ConversionMethods.getTotal(crypto, 0);
      expect(getTotalSecond, '0.00 BTC');
    });
  });
}
