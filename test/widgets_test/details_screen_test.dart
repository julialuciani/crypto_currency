import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_crypto/details/widgets/change_days_button.dart';
import 'package:projeto_crypto/details/widgets/chart_button.dart';
import 'package:projeto_crypto/details/widgets/upper_column_crypto.dart';
import 'package:projeto_crypto/shared/templates/button_default_app.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';
import 'package:projeto_crypto/shared/utils/app_bar_default.dart';

import '../helpers/crypto_mock_data.dart';
import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing details screen', () {
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
              arguments:
                  AppArguments(crypto: crypto, singleBalance: cryptoBalance),
              label: ''));

      final buttonFinder = find.byType(ButtonDefaulApp);
      expect(buttonFinder, findsOneWidget);
    });
  });
}