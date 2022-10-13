import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/conversion/methods/conversion_methods.dart';

import '../../shared/crypto_mock_data.dart';

void main() {
  group('Testing conversion methods', () {
    test('WHEN testing getTotal THEN return expectations', () async {
      double getTotal = ConversionMethods.getTotal(5, 5);
      expect(getTotal, 1.0);
    });
    test('WHEN testing formattingValue THEN return a formatted value',
        () async {
      expect(ConversionMethods.formattingValue('0,2'), '0.2');
    });

    test('WHEN a value starts with a special character THEN return false',
        () async {
      expect(ConversionMethods.isCorrect('.1'), false);
      expect(ConversionMethods.isCorrect('-1'), false);
      expect(ConversionMethods.isCorrect('+1'), false);
      expect(ConversionMethods.isCorrect(',1'), false);
      expect(ConversionMethods.isCorrect('0.1'), true);
    });

    test('WHEN controller receives a value THEN convert this value', () async {
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
  });
}
