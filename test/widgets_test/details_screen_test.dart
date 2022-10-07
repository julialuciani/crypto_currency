import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';
import 'package:projeto_crypto/details/widgets/body_details_screen.dart';
import 'package:projeto_crypto/details/widgets/change_days_button.dart';
import 'package:projeto_crypto/details/widgets/chart_button.dart';
import 'package:projeto_crypto/details/widgets/chart_details_screen.dart';
import 'package:projeto_crypto/details/widgets/column_infos.dart';
import 'package:projeto_crypto/details/widgets/upper_column_crypto.dart';
import 'package:projeto_crypto/shared/templates/button_default_app.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';
import 'package:projeto_crypto/shared/templates/app_bar_default.dart';

import '../helpers/crypto_mock_data.dart';
import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing details screen', () {
    testWidgets('Testing if body details has all it needs',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            BodyDetailsScreen(
                crypto: crypto,
                singleBalance: cryptoBalance,
                data: CryptosMarkeDataViewData(lista)));
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

        expect(upperColumnCryptoFinder, findsOneWidget);
        expect(spaceFinder, findsWidgets);
        expect(columnFinder, findsWidgets);
        expect(paddingFinnder, findsWidgets);
        expect(chartDetailsScreen, findsWidgets);
        expect(changeDaysButton, findsWidgets);
        expect(dividerFinder, findsWidgets);
        expect(columnInfosFinder, findsWidgets);
        expect(buttonDefaultAppFinder, findsWidgets);
      });
    });
    testWidgets('Testing appBar', (WidgetTester tester) async {
      await loadPage(tester, const AppBarDefault(title: 'Detalhes'));

      final appBarFinder = find.byType(AppBar);
      expect(appBarFinder, findsOneWidget);
    });

    testWidgets('Testing upper container', (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await loadPage(tester, UpperColumnCrypto(crypto: crypto));
        await tester.pumpAndSettle();

        final textFinder = find.byType(Text);
        final imageFinder = find.byType(Image);

        expect(textFinder, findsAtLeastNWidgets(3));
        expect(imageFinder, findsOneWidget);
      });
    });

    testWidgets('Testing  ChangeDaysButton', (WidgetTester tester) async {
      await loadPage(tester, const ChangeDaysButtons());

      final buttonFinder = find.byType(ChartButton);
      final rowFinder = find.byType(Row);

      expect(rowFinder, findsOneWidget);
      expect(buttonFinder, findsWidgets);
    });

    testWidgets('Testing CharButton', (WidgetTester tester) async {
      await loadPage(tester, const ChartButton(daysButton: 5, title: '5D'));
      await tester.pumpAndSettle();

      final textFinder = find.byType(Text);
      final containerFinder = find.byType(Container);
      final inkWellFinder = find.byType(InkWell);
      final chartButtonFinder = find.byType(ChartButton);
      final ChartButton chartButton = tester.widget(chartButtonFinder);

      expect(chartButton.daysButton, 5);
      expect(chartButton.title, '5D');
      expect(chartButtonFinder, findsOneWidget);
      expect(textFinder, findsOneWidget);
      expect(containerFinder, findsOneWidget);
      expect(inkWellFinder, findsOneWidget);
    });

    testWidgets('Testing button', (WidgetTester tester) async {
      await loadPage(
          tester,
          ButtonDefaulApp(
              route: '/conversion',
              arguments:
                  AppArguments(crypto: crypto, singleBalance: cryptoBalance),
              label: ''));

      final buttonFinder = find.byType(ButtonDefaulApp);
      expect(buttonFinder, findsOneWidget);
    });

    testWidgets('Testing ChartDetails', (WidgetTester tester) async {
      List<FlSpot> data = lista
          .map((price) => FlSpot(price[0].toDouble(), price[1].toDouble()))
          .toList();
      await loadPage(tester, ChartDetailsScreen(list: data));
      await tester.pumpAndSettle();

      final aspectRationFinder = find.byType(AspectRatio);
      final lineChartFinder = find.byType(LineChart);

      expect(aspectRationFinder, findsOneWidget);
      expect(lineChartFinder, findsOneWidget);
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
