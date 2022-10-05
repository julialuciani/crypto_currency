import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_crypto/portifolio/widgets/body_portifolio_screen.dart';
import 'package:projeto_crypto/portifolio/widgets/invisible_container.dart';
import 'package:projeto_crypto/portifolio/widgets/listile_crypto.dart';
import 'package:projeto_crypto/portifolio/widgets/listview_crypto.dart';
import 'package:projeto_crypto/portifolio/widgets/upper_container_crypto.dart';

import '../helpers/crypto_mock_data.dart';
import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing portifolio screen', () {
    testWidgets('Testing if body has all it needs',
        (WidgetTester tester) async {
      await loadPage(tester, const BodyPortifolioScreen());
      await tester.pumpAndSettle();

      final upperContainerFinder = find.byType(UpperContainerCrypto);
      final dividerFinder = find.byType(Divider);
      final listViewCryptosFinder = find.byType(ListViewCryptos);

      expect(upperContainerFinder, findsOneWidget);
      expect(dividerFinder, findsOneWidget);
      expect(listViewCryptosFinder, findsOneWidget);
    });
    testWidgets('Checking icon visibility', (WidgetTester tester) async {
      await loadPage(tester, const UpperContainerCrypto());

      final Finder iconFinder = find.byType(IconButton);

      expect(find.byIcon(Icons.visibility), findsOneWidget);
      expect(find.byIcon(Icons.visibility_off), findsNothing);
      tester.widget(iconFinder);

      await tester.tap(iconFinder);
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
      expect(find.byIcon(Icons.visibility), findsNothing);
    });

    testWidgets('Testing number of texts visible', (WidgetTester tester) async {
      await loadPage(tester, const UpperContainerCrypto());

      final Finder textFinder = find.byType(Text);
      expect(textFinder, findsAtLeastNWidgets(3));
    });

    testWidgets('Testing if every price gets invisible',
        (WidgetTester tester) async {
      await loadPage(tester, const BodyPortifolioScreen());
      await tester.pumpAndSettle();

      final iconFinder = find.byIcon(Icons.visibility);
      final invisibleContainerFinder = find.byType(InvisibleContainer);

      expect(iconFinder, findsOneWidget);
      tester.widget(iconFinder);

      await tester.tap(iconFinder);
      await tester.pumpAndSettle();

      expect(invisibleContainerFinder, findsWidgets);
    });

    testWidgets('Testing ListView', (WidgetTester tester) async {
      await loadPage(tester, const ListViewCryptos());

      await tester.pumpAndSettle();
      final Finder listViewFinder = find.byType(ListViewCryptos);

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('Making sure listTile has info', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester,
            ListTitleCrypto(crypto: crypto, cryptoBalance: cryptoBalance));
        await tester.pumpAndSettle();

        final textFinder = find.byType(Text);
        final imageFinder = find.byType(Image);
        final iconFinder = find.byIcon(Icons.arrow_forward_ios);

        expect(textFinder, findsAtLeastNWidgets(4));
        expect(imageFinder, findsOneWidget);
        expect(iconFinder, findsOneWidget);
      });
    });
  });
}
