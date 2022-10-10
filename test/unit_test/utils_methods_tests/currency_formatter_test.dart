import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/shared/utils/currency_formatter.dart';

void main() {
  test(
      'When receives a value then formats to the currency according to the locale',
      () async {
    String format = FormatCurrency.format(20);
    if (Platform.localeName == 'pt_BR') {
      expect(format, 'R\$ 20,00');
    }
    expect(format, '\$20.00');
  });
}
