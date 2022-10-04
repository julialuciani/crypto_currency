import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_crypto/conversion/widgets/button_change_coin.dart';
import 'package:projeto_crypto/conversion/widgets/interactive_text.dart';
import 'package:projeto_crypto/conversion/widgets/total_container.dart';
import 'package:projeto_crypto/conversion/widgets/upper_container_conversion.dart';
import 'package:projeto_crypto/portifolio/widgets/listview_crypto.dart';

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

    testWidgets('Testing change coin button has all it needs',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            ButtonChangeCoin(
                crypto: crypto,
                data: [crypto, crypto],
                listView: const ListViewCryptos()));
        await tester.pumpAndSettle();

        final sizedBoxFinder = find.byType(SizedBox);
        final textFinder = find.byType(Text);
        final iconFinder = find.byIcon(Icons.expand_more);
        final imageFinder = find.byType(Image);
        final circleAvatarFinder = find.byType(CircleAvatar);

        expect(textFinder, findsOneWidget);
        expect(iconFinder, findsOneWidget);
        expect(imageFinder, findsOneWidget);
        expect(circleAvatarFinder, findsOneWidget);
        expect(sizedBoxFinder, findsAtLeastNWidgets(2));
      });
    });
  });
}