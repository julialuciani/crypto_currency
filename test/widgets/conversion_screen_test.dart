import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/conversion/widgets/interactive_text.dart';
import 'package:projeto_crypto/conversion/widgets/total_container.dart';
import 'package:projeto_crypto/conversion/widgets/upper_container_conversion.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing conversion screen', () {
    testWidgets('Testing UpperContainer', (WidgetTester tester) async {
      await loadPage(
          tester,
          UpperAvailableBalanceContainer(
              crypto: CryptoViewData(
                  id: 'bitcoim',
                  symbol: 'btc',
                  name: 'Bitcoin',
                  image: 'assets/icons/cent.png',
                  currentPrice: 0.0,
                  variation: 0.0),
              singleBalance: 0.7));

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
