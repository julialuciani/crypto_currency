import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/details/widgets/change_days_button.dart';
import 'package:projeto_crypto/details/widgets/chart_button.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/shared/templates/button_default_app.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';
import 'package:projeto_crypto/shared/utils/app_bar_default.dart';

import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing details screen', () {
    testWidgets('Testing appBar', (WidgetTester tester) async {
      await loadPage(tester, const AppBarDefault(title: 'Detalhes'));

      final appBarFinder = find.byType(AppBar);
      expect(appBarFinder, findsOneWidget);
    });

    testWidgets('Testing buttons chart', (WidgetTester tester) async {
      await loadPage(tester, const ChangeDaysButtons());

      final buttonFider = find.byType(ChartButton);
      expect(buttonFider, findsWidgets);
    });

    testWidgets('Testing button', (WidgetTester tester) async {
      await loadPage(
          tester,
          ButtonDefaulApp(
              route: '/conversion',
              arguments: AppArguments(
                  crypto: CryptoViewData(
                      id: 'bitcoim',
                      symbol: 'btc',
                      name: 'Bitcoin',
                      image: 'assets/icons/cent.png',
                      currentPrice: 0.0,
                      variation: 0.0),
                  singleBalance: 0.75),
              label: ''));

      final buttonFinder = find.byType(ButtonDefaulApp);
      expect(buttonFinder, findsOneWidget);
    });
  });
}
