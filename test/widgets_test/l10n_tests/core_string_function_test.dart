import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:projeto_crypto/l10n/core_strings.dart';

void main() {
  test('WHEN CoreString has erros THEN test exception', () async {
    expect(
        () => lookupCoreString(const Locale('kk', 'BK')), throwsFlutterError);
  });

  test('WHEN CoreString should reload THEN return expectations', () async {
    expect(CoreString.delegate.shouldReload.call(CoreString.delegate), false);
  });
}
