import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_crypto/portifolio/widgets/body_portifolio_screen.dart';
import 'package:projeto_crypto/portifolio/widgets/invisible_container.dart';
import 'package:projeto_crypto/portifolio/widgets/listile_crypto.dart';
import 'package:projeto_crypto/portifolio/widgets/listview_crypto.dart';
import 'package:projeto_crypto/portifolio/widgets/upper_container_crypto.dart';
import 'package:projeto_crypto/shared/templates/bottom_navigation_bar_app.dart';

import '../helpers/crypto_mock_data.dart';
import '../helpers/setup_widget_tester.dart';
import '../unit_test/screen_methods_test/portifolio_methods_test.dart';

void main() {
  group('Testing portifolio screen', () {
    testWidgets('Testing if body has all it needs',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            BodyPortifolioScreen(
              data: data,
              singleBalance: single,
            ));
        await tester.pumpAndSettle();

        final upperContainerFinder = find.byType(UpperContainerCrypto);
        final dividerFinder = find.byType(Divider);
        final listViewCryptosFinder = find.byType(ListViewCryptos);
        final expandedFinder = find.byKey(const Key('expanded'));

        expect(upperContainerFinder, findsOneWidget);
        expect(dividerFinder, findsWidgets);
        expect(listViewCryptosFinder, findsOneWidget);
        expect(expandedFinder, findsOneWidget);
      });
    });

    testWidgets('Testing bottom navigation bar', (WidgetTester tester) async {
      await loadPage(tester, const BottomNavigationBarApp(index: 0));
      await tester.pumpAndSettle();
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
      await loadPage(
          tester,
          BodyPortifolioScreen(
            data: data,
            singleBalance: single,
          ));
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
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            ListViewCryptos(
              data: data,
              singleBalance: single,
            ));

        await tester.pumpAndSettle();
        final listViewFinder = find.byType(ListViewCryptos);
        final listFinder = find.byType(ListView);
        final listTileFinder = find.byType(ListTile);
        final ListViewCryptos listCheck = tester.widget(listViewFinder);

        expect(listViewFinder, findsOneWidget);
        expect(listFinder, findsWidgets);
        expect(listTileFinder, findsWidgets);
        expect(listCheck.singleBalance, single);
        expect(listCheck.data, data);
      });
    });

    testWidgets('Making sure listTile has info', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester,
            ListTitleCrypto(crypto: crypto, cryptoBalance: cryptoBalance));
        await tester.pumpAndSettle();

        final textFinder = find.byType(Text);
        final imageFinder = find.byType(Image);
        final iconFinder = find.byIcon(Icons.arrow_forward_ios);
        final rowFinder = find.byType(Row);
        final listTileFinder = find.byType(ListTitleCrypto);
        final ListTitleCrypto listTileCheck = tester.widget(listTileFinder);
        final normalListTile = find.byType(ListTile);

        expect(listTileCheck.crypto, crypto);
        expect(listTileFinder, findsOneWidget);
        expect(textFinder, findsWidgets);
        expect(imageFinder, findsOneWidget);
        expect(iconFinder, findsOneWidget);
        expect(rowFinder, findsWidgets);
        expect(normalListTile, findsWidgets);
      });
    });
  });
}
