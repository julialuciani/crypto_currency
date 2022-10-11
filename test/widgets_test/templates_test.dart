import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/movements/widgets/list_view_movements.dart';
import 'package:projeto_crypto/shared/style/colors.dart';
import 'package:projeto_crypto/shared/templates/app_bar_default.dart';
import 'package:projeto_crypto/shared/templates/bottom_navigation_bar_app.dart';
import 'package:projeto_crypto/shared/templates/button_default_app.dart';
import 'package:projeto_crypto/shared/templates/error_body.dart';
import 'package:projeto_crypto/shared/templates/loading_body.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';

import '../helpers/crypto_mock_data.dart';
import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing templates', () {
    testWidgets(
        'When ButtonDefaultApp is called then expect to find its widgets and tap it',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          ButtonDefaulApp(
              route: '/portifolio',
              arguments: AppArguments(
                  crypto: crypto,
                  singleBalance: cryptoBalance,
                  list: [crypto, crypto]),
              label: 'Converter'));
      await tester.pumpAndSettle();

      final buttonFinder = find.byType(ButtonDefaulApp);
      final textFinder = find.byType(Text);
      final ButtonDefaulApp button = tester.widget(buttonFinder);
      final paddingFinder = find.byType(Padding);
      final materialButtonFinder = find.byType(MaterialButton);

      expect(materialButtonFinder, findsOneWidget);
      expect(textFinder, findsOneWidget);
      expect(buttonFinder, findsOneWidget);
      expect(button.label, 'Converter');
      expect(button.route, '/portifolio');
      expect(paddingFinder, findsWidgets);

      await tester.tap(materialButtonFinder);
      await tester.pumpAndSettle();
    });

    testWidgets(
        'When ErrorBody is tapped then expects to find its widgets and tap its button',
        (WidgetTester tester) async {
      await loadPage(tester, ErrorBody(onError: () {}));
      await tester.pumpAndSettle();

      final textFinder = find.byType(Text);
      final iconWarningFinder = find.byIcon(Icons.warning);
      final iconSyncFinder = find.byIcon(Icons.sync);
      final circleAvatarFinder = find.byType(CircleAvatar);
      final sizedBoxFinder = find.byType(SizedBox);
      final inkWellFinder = find.byType(InkWell);
      final columnFinder = find.byType(Column);

      expect(textFinder, findsOneWidget);
      expect(iconWarningFinder, findsOneWidget);
      expect(iconSyncFinder, findsOneWidget);
      expect(circleAvatarFinder, findsOneWidget);
      expect(sizedBoxFinder, findsWidgets);
      expect(inkWellFinder, findsOneWidget);
      expect(columnFinder, findsOneWidget);

      await tester.tap(iconSyncFinder);
      await tester.pumpAndSettle();
    });

    testWidgets('When LoadingBody is called then expects to find its widgets',
        (WidgetTester tester) async {
      await loadPage(tester, const LoadingBody());

      final centerFinder = find.byType(Center);

      expect(centerFinder, findsOneWidget);
    });

    testWidgets(
        'When BottomNavigationBarApp is on PortfolioScreen then go to MovementsScreen',
        (WidgetTester tester) async {
      await loadPage(tester, const BottomNavigationBarApp(index: 0));
      await tester.pumpAndSettle();

      final barFinder = find.byType(BottomNavigationBarApp);
      final BottomNavigationBarApp bottomBar = tester.widget(barFinder);
      final iconFinder = find.byType(ImageIcon);
      final labelFinder = find.byType(Text);
      final normalBottom = find.byType(BottomNavigationBar);
      final BottomNavigationBar normalBottomBar = tester.widget(normalBottom);
      final itemFinder = find.byType(BottomNavigationBarApp);

      expect(itemFinder, findsWidgets);
      expect(barFinder, findsOneWidget);
      expect(bottomBar.index, 0);
      expect(normalBottomBar.selectedItemColor, magenta);
      expect(iconFinder, findsWidgets);
      expect(labelFinder, findsWidgets);

      await tester.tap(normalBottom.last);
      await tester.pumpAndSettle();

      expect(find.byType(ListViewMovements), findsWidgets);

      await tester.tap(normalBottom.first);
      await tester.pumpAndSettle();
    });
    testWidgets(
        'When BottomNavigationBarApp is on Movements then go to PortfoliosScreen',
        (WidgetTester tester) async {
      await loadPage(tester, const BottomNavigationBarApp(index: 1));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Portfólio'));
      await tester.pumpAndSettle();
    });

    testWidgets(
        'When AppBarDefault is called then expects its widgets and tap the arrow_back icon',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          const AppBarDefault(
            title: 'App',
          ));
      await tester.pumpAndSettle();

      final iconButtonFinder = find.byType(IconButton);
      final iconBack = find.byIcon(Icons.arrow_back_ios);
      final textFinder = find.byType(Text);
      final appBarDefaultFinder = find.byType(AppBarDefault);
      final appBarFinder = find.byType(AppBar);
      final AppBarDefault appBarTest = tester.widget(appBarDefaultFinder);

      expect(iconButtonFinder, findsOneWidget);
      expect(iconBack, findsOneWidget);
      expect(textFinder, findsOneWidget);
      expect(appBarDefaultFinder, findsOneWidget);
      expect(appBarTest.title, 'App');
      expect(appBarFinder, findsOneWidget);

      await tester.tap(iconBack);
      await tester.pumpAndSettle();
    });
  });
}
