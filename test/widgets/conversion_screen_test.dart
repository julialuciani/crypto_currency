import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/conversion/widgets/interactive_text.dart';
import 'package:projeto_crypto/conversion/widgets/total_container.dart';
import 'package:projeto_crypto/conversion/widgets/upper_container_conversion.dart';

import '../helpers/crypto_mock_data.dart';
import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing conversion screen', () {
    testWidgets('Testing UpperContainer', (WidgetTester tester) async {
      await loadPage(
          tester,
          UpperAvailableBalanceContainer(
              crypto: crypto, singleBalance: cryptoBalance));

      final upperContainerFinder = find.byType(UpperAvailableBalanceContainer);
      expect(upperContainerFinder, findsOneWidget);
    });

    testWidgets('Testing total container', (WidgetTester tester) async {
      await loadPage(tester, const TotalContainer(total: '2'));

      final dividerFinder = find.byType(Divider);
      final textFinder = find.byType(Text);

      expect(dividerFinder, findsOneWidget);
      expect(textFinder, findsAtLeastNWidgets(2));
    });

    testWidgets('Testing interactive text', (WidgetTester tester) async {
      await loadPage(tester, const InteractiveText());
      final textFinder = find.byType(InteractiveText);
      expect(textFinder, findsOneWidget);
    });
  });
}
