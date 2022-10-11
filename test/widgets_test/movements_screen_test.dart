import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/movements/view/movements_screen.dart';
import 'package:projeto_crypto/movements/widgets/body_movements.dart';
import 'package:projeto_crypto/movements/widgets/container_movements.dart';
import 'package:projeto_crypto/movements/widgets/list_tile_movements.dart';
import 'package:projeto_crypto/movements/widgets/list_view_movements.dart';
import 'package:projeto_crypto/shared/templates/bottom_navigation_bar_app.dart';

import '../helpers/crypto_mock_data.dart';
import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing movemnts screen', () {
    testWidgets(
        'When BodyMovements is called then test if it has all the widgets it needs',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          BodyMovements(
            movements: [movement],
          ));

      final dividerFinder = find.byType(Divider);
      final columnFinder = find.byType(Column);
      final containerMovementsFinder = find.byType(ContainerMovementsText);
      final listViewMovementsFinder = find.byType(ListViewMovements);
      final expandedFinder = find.byType(Expanded);

      expect(expandedFinder, findsOneWidget);
      expect(dividerFinder, findsWidgets);
      expect(columnFinder, findsWidgets);
      expect(containerMovementsFinder, findsOneWidget);
      expect(listViewMovementsFinder, findsOneWidget);
    });

    testWidgets(
        'When MovementsScreen its called then test if it has all the widgets it needs',
        (WidgetTester tester) async {
      await loadPage(tester, const MovementsScreen());
      await tester.pumpAndSettle();

      final bodyFinder = find.byType(BodyMovements);
      final bottomFinder = find.byType(BottomNavigationBarApp);
      final scaffoldFinder = find.byType(Scaffold);
      final safeAreaFinder = find.byType(SafeArea);

      expect(safeAreaFinder, findsOneWidget);
      expect(scaffoldFinder, findsOneWidget);
      expect(bottomFinder, findsOneWidget);
      expect(bodyFinder, findsOneWidget);

      await tester.tap(bottomFinder);
      await tester.pumpAndSettle();
    });

    testWidgets(
        'When ContainerMovementsText is called then tests if it has all the widgets it needs',
        (WidgetTester tester) async {
      await loadPage(tester, const ContainerMovementsText());

      final textFinder = find.byType(Text);
      final containerFinder = find.byType(Container);
      final containerMovementsTextFinder = find.byType(ContainerMovementsText);

      expect(containerFinder, findsWidgets);
      expect(textFinder, findsOneWidget);
      expect(containerMovementsTextFinder, findsOneWidget);
    });

    testWidgets(
        'When ListViewMovements is called then tests if it has all the widgets it needs',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          ListViewMovements(
            movements: [movement],
          ));
      await tester.pumpAndSettle();

      final listViewFinder = find.byType(ListView);
      final listTileFinder = find.byType(ListTileMovements);
      final ListTileMovements listTile = tester.widget(listTileFinder);

      expect(listViewFinder, findsOneWidget);
      expect(listTileFinder, findsOneWidget);
      expect(listTile.convertQuantity, movement.converted);
      expect(listTile.receiveQuantity, movement.received);
      expect(listTile.total, movement.valueInReal);
    });

    testWidgets(
        'When ListTile is called then tests if it has all the widgets it needs',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          ListTileMovements(
              convertQuantity: '1',
              receiveQuantity: '1',
              total: '1',
              date: DateTime.now()));
      await tester.pumpAndSettle();

      final textFinder = find.byType(Text);
      final rowFinder = find.byType(Row);

      expect(textFinder, findsAtLeastNWidgets(4));
      expect(rowFinder, findsAtLeastNWidgets(2));
    });
  });
}
