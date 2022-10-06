import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/shared/style/colors.dart';
import 'package:projeto_crypto/shared/templates/bottom_navigation_bar_app.dart';
import 'package:projeto_crypto/shared/templates/button_default_app.dart';
import 'package:projeto_crypto/shared/templates/error_body.dart';
import 'package:projeto_crypto/shared/templates/loading_body.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';

import '../helpers/crypto_mock_data.dart';
import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing templates', () {
    testWidgets('Testing ButtonDefaultApp', (WidgetTester tester) async {
      await loadPage(
          tester,
          ButtonDefaulApp(
              route: '/portifolio',
              arguments:
                  AppArguments(crypto: crypto, singleBalance: cryptoBalance),
              label: 'Converter'));
      await tester.pumpAndSettle();

      final buttonFinder = find.byType(ButtonDefaulApp);
      final textFinder = find.byType(Text);
      final ButtonDefaulApp button = tester.widget(buttonFinder);
      final paddingFinder = find.byType(Padding);

      expect(textFinder, findsOneWidget);
      expect(buttonFinder, findsOneWidget);
      expect(button.label, 'Converter');
      expect(button.route, '/portifolio');
      expect(paddingFinder, findsWidgets);
    });

    testWidgets('Testing ErrorBody', (WidgetTester tester) async {
      await loadPage(tester, ErrorBody(onError: () {}));
      await tester.pumpAndSettle();

      final textFinder = find.byType(Text);
      final iconWarningFinder = find.byIcon(Icons.warning);
      final iconSyncFinder = find.byIcon(Icons.sync);
      final circleAvatarFinder = find.byType(CircleAvatar);
      final sizedBoxFinder = find.byType(SizedBox);
      final inkWellFinder = find.byType(InkWell);
      final columnFinder = find.byType(Column);
      final paddingFinder = find.byType(Padding);

      expect(textFinder, findsOneWidget);
      expect(iconWarningFinder, findsOneWidget);
      expect(iconSyncFinder, findsOneWidget);
      expect(circleAvatarFinder, findsOneWidget);
      expect(sizedBoxFinder, findsWidgets);
      expect(inkWellFinder, findsOneWidget);
      expect(columnFinder, findsOneWidget);
      expect(paddingFinder, findsOneWidget);
    });

    testWidgets('Testing LoadingBody', (WidgetTester tester) async {
      await loadPage(tester, const LoadingBody());

      final centerFinder = find.byType(Center);

      expect(centerFinder, findsOneWidget);
    });

    testWidgets('Testing Bottom Navigation Bar App',
        (WidgetTester tester) async {
      await loadPage(tester, const BottomNavigationBarApp(index: 1));
      await tester.pumpAndSettle();

      final barFinder = find.byType(BottomNavigationBarApp);
      final BottomNavigationBarApp bottomBar = tester.widget(barFinder);
      final iconFinder = find.byType(ImageIcon);
      final labelFinder = find.byType(Text);
      final normalBottom = find.byType(BottomNavigationBar);
      final BottomNavigationBar normalBottomBar = tester.widget(normalBottom);

      expect(barFinder, findsOneWidget);
      expect(bottomBar.index, 1);
      expect(normalBottomBar.selectedItemColor, magenta);
      expect(iconFinder, findsWidgets);
      expect(labelFinder, findsWidgets);
    });
  });
}
