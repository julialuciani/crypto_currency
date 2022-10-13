import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_crypto/portfolio/view/portfolio_screen.dart';
import 'package:projeto_crypto/portfolio/widgets/body_portifolio_screen.dart';
import 'package:projeto_crypto/portfolio/widgets/invisible_container.dart';
import 'package:projeto_crypto/portfolio/widgets/listile_crypto.dart';
import 'package:projeto_crypto/portfolio/widgets/listview_crypto.dart';
import 'package:projeto_crypto/portfolio/widgets/upper_container_crypto.dart';
import 'package:projeto_crypto/shared/templates/bottom_navigation_bar_app.dart';

import '../shared/crypto_mock_data.dart';
import '../helpers/setup/setup_widget_tester.dart';

void main() {
  group('Testing portifolio screen', () {
    testWidgets(
        'WHEN testing Portifolios Screen THEN taps the refresh error button',
        (WidgetTester tester) async {
      await loadPage(tester, const PortfolioScreen());
      await tester.pumpAndSettle();

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();
    });
    testWidgets(
        'WHEN BodyPortifolioScreen is called THEN tests if it has all the widgets it needs',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            BodyPortifolioScreen(
              data: data,
              singleBalance: singleBalance,
            ));
        await tester.pumpAndSettle();

        final upperContainerFinder = find.byType(UpperContainerCrypto);
        final dividerFinder = find.byType(Divider);
        final listViewCryptosFinder = find.byType(ListViewCryptos);
        final expandedFinder = find.byType(Expanded);

        expect(upperContainerFinder, findsOneWidget);
        expect(dividerFinder, findsWidgets);
        expect(listViewCryptosFinder, findsOneWidget);
        expect(expandedFinder, findsOneWidget);
      });
    });

    testWidgets(
        'WHEN BottomNavigationBarApp is called THEN tests if it has all the widgets it needs',
        (WidgetTester tester) async {
      await loadPage(tester, const BottomNavigationBarApp(index: 0));
      await tester.pumpAndSettle();
    });

    testWidgets('WHEN tap on visibility_icon THEN expect it changes icon',
        (WidgetTester tester) async {
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

    testWidgets(
        'WHEN called UpperContainerCrypto THEN tests if it has the number of texts it should have',
        (WidgetTester tester) async {
      await loadPage(tester, const UpperContainerCrypto());

      final Finder textFinder = find.byType(Text);
      expect(textFinder, findsAtLeastNWidgets(3));
    });

    testWidgets(
        'WHEN presses on the visibility icon THEN finds invisibleContainers that replace the text',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          BodyPortifolioScreen(
            data: data,
            singleBalance: singleBalance,
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

    testWidgets(
        'WHEN ListViewCryptos is called THEN expects to find its widgets',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            ListViewCryptos(
              data: [crypto, cryptoSecond],
              singleBalance: const [0.5, 0.5],
            ));

        await tester.pumpAndSettle();
        final listViewFinder = find.byType(ListViewCryptos);
        final listFinder = find.byType(ListView);
        final listTileFinder = find.byType(ListTile);
        final ListViewCryptos listCheck = tester.widget(listViewFinder);

        expect(listViewFinder, findsOneWidget);
        expect(listFinder, findsWidgets);
        expect(listTileFinder, findsWidgets);
        expect(listCheck.singleBalance, [0.5, 0.5]);
        expect(listCheck.data, [crypto, cryptoSecond]);

        await tester.tap(listViewFinder);
        await tester.tap(listTileFinder.first);
        await tester.pumpAndSettle();
      });
    });

    testWidgets(
        'WHEN ListTile is called THEN expect to find its widgets and its infos',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            ListTitleCrypto(
              crypto: crypto,
              cryptoBalance: cryptoBalance,
              list: [crypto, crypto],
            ));
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

        await tester.tap(listTileFinder);
        await tester.pumpAndSettle();
      });
    });
  });
}
