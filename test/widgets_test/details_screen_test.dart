import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';
import 'package:projeto_crypto/details/view/details_screen.dart';
import 'package:projeto_crypto/details/widgets/body_details_screen.dart';
import 'package:projeto_crypto/details/widgets/change_days_button.dart';
import 'package:projeto_crypto/details/widgets/chart_button.dart';
import 'package:projeto_crypto/details/widgets/chart_details_screen.dart';
import 'package:projeto_crypto/details/widgets/column_infos.dart';
import 'package:projeto_crypto/details/widgets/upper_column_crypto.dart';
import 'package:projeto_crypto/shared/templates/button_default_app.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';
import 'package:projeto_crypto/shared/templates/app_bar_default.dart';

import '../shared/crypto_mock_data.dart';
import '../helpers/setup/setup_widget_tester.dart';
import '../unit_test/screen_methods_test/portifolio_methods_test.dart';

void main() {
  group('Testing details screen', () {
    testWidgets(
        'WHEN testing Details Screen THEN taps the refresh error button',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          DetailsScreen(
            crypto: crypto,
            list: data,
            singleBalance: cryptoBalance,
          ));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();
    });
    testWidgets(
        'WHEN BodyDetailsScreen is called THEN test if it has all the widgets it needs',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        CryptosMarkeDataViewData cryptosMarket =
            CryptosMarkeDataViewData(lista);
        await loadPage(
            tester,
            BodyDetailsScreen(
              crypto: crypto,
              singleBalance: cryptoBalance,
              data: cryptosMarket,
              list: [crypto, crypto],
            ));
        await tester.pumpAndSettle();

        final upperColumnCryptoFinder = find.byType(UpperColumnCrypto);
        final spaceFinder = find.byType(Spacer);
        final columnFinder = find.byType(Column);
        final paddingFinnder = find.byType(Padding);
        final chartDetailsScreen = find.byType(ChartDetailsScreen);
        final changeDaysButton = find.byType(ChangeDaysButtons);
        final dividerFinder = find.byType(Divider);
        final columnInfosFinder = find.byType(ColumnInfos);
        final buttonDefaultAppFinder = find.byType(ButtonDefaulApp);
        final BodyDetailsScreen bodyTester =
            tester.widget(find.byType(BodyDetailsScreen));

        expect(upperColumnCryptoFinder, findsOneWidget);
        expect(spaceFinder, findsWidgets);
        expect(columnFinder, findsWidgets);
        expect(paddingFinnder, findsWidgets);
        expect(chartDetailsScreen, findsWidgets);
        expect(changeDaysButton, findsWidgets);
        expect(dividerFinder, findsWidgets);
        expect(columnInfosFinder, findsWidgets);
        expect(buttonDefaultAppFinder, findsWidgets);
        expect(bodyTester.crypto, crypto);
        expect(bodyTester.singleBalance, cryptoBalance);
        expect(bodyTester.data, cryptosMarket);
        expect(bodyTester.list, [crypto, crypto]);

        await tester.pumpAndSettle();
        await tester.tap(buttonDefaultAppFinder);
        await tester.pumpAndSettle();
      });
    });
    testWidgets('WHEN appBar is called THEN find it and tap it',
        (WidgetTester tester) async {
      await loadPage(tester, const AppBarDefault(title: 'Detalhes'));

      final appBarFinder = find.byType(AppBar);
      expect(appBarFinder, findsOneWidget);

      await tester.tap(appBarFinder);
      await tester.pumpAndSettle();
    });

    testWidgets(
        'WHEN UpperColumnCrypto is called THEN test if it has all the widgets it needs',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester, UpperColumnCrypto(crypto: crypto));
        await tester.pumpAndSettle();

        final textFinder = find.byType(Text);
        final imageFinder = find.byType(Image);

        expect(textFinder, findsAtLeastNWidgets(3));
        expect(imageFinder, findsOneWidget);
      });
    });

    testWidgets(
        'WHEN ChangeDaysButtons is called THEN tests if it has all the widgets it needs and tap',
        (WidgetTester tester) async {
      await loadPage(tester, const ChangeDaysButtons());

      final buttonFinder = find.byType(ChartButton);
      final rowFinder = find.byType(Row);

      expect(rowFinder, findsOneWidget);
      expect(buttonFinder, findsWidgets);

      await tester.tap(buttonFinder.first);
      await tester.pumpAndSettle();
    });

    testWidgets(
        'WHEN ChartButton is called THEN tap it and see if has all the widgets it needs',
        (WidgetTester tester) async {
      await loadPage(tester, const ChartButton(daysButton: 5, title: '5D'));
      await tester.pumpAndSettle();

      final textFinder = find.byType(Text);
      final containerFinder = find.byType(Container);
      final inkWellFinder = find.byType(InkWell);
      final chartButtonFinder = find.byType(ChartButton);
      final ChartButton chartButton = tester.widget(chartButtonFinder);
      final InkWell inkWell = tester.widget(inkWellFinder);

      expect(chartButton.daysButton, 5);
      expect(chartButton.title, '5D');
      expect(chartButtonFinder, findsOneWidget);
      expect(textFinder, findsOneWidget);
      expect(containerFinder, findsOneWidget);
      expect(inkWell.onTap != null, true);
      expect(inkWellFinder, findsOneWidget);
      await tester.tap(chartButtonFinder);
      await tester.pumpAndSettle();
    });

    testWidgets('WHEN ButtonDefaultApp is called THEN tap it',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            ButtonDefaulApp(
                route: '/conversion',
                arguments: AppArguments(
                    crypto: crypto,
                    singleBalance: cryptoBalance,
                    list: [crypto, crypto]),
                label: ''));

        final buttonFinder = find.byType(ButtonDefaulApp);
        final materialFinder = find.byType(MaterialButton);
        final MaterialButton button = tester.widget(materialFinder);

        expect(buttonFinder, findsOneWidget);
        expect(materialFinder, findsWidgets);
        expect(button.onPressed != null, true);
        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();
      });
    });

    testWidgets('WHEN ChartDetailsScreen THEN create chart according to list',
        (WidgetTester tester) async {
      List<FlSpot> data = lista
          .map((price) => FlSpot(price[0].toDouble(), price[1].toDouble()))
          .toList();
      await loadPage(tester, ChartDetailsScreen(list: data));
      await tester.pumpAndSettle();

      final aspectRationFinder = find.byType(AspectRatio);
      final lineChartFinder = find.byType(LineChart);
      final chartDetailsFinder = find.byType(ChartDetailsScreen);

      expect(aspectRationFinder, findsOneWidget);
      expect(lineChartFinder, findsOneWidget);
      expect(chartDetailsFinder, findsWidgets);

      await tester.drag(chartDetailsFinder, const Offset(20, 20));
    });
  });
}

List<List<num>> lista = [
  [20, 40],
  [20, 40],
  [20, 40],
  [20, 40],
  [20, 40],
  [20, 40],
  [20, 40],
  [20, 40],
];
