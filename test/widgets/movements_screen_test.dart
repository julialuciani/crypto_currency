import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/movements/widgets/body_movements.dart';
import 'package:projeto_crypto/movements/widgets/container_movements.dart';
import 'package:projeto_crypto/movements/widgets/list_view_movements.dart';

import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing movemnts screen', () {
    testWidgets('Testing if the body has all it needs',
        (WidgetTester tester) async {
      await loadPage(tester, const BodyMovements());

      final dividerFinder = find.byType(Divider);
      final columnFinder = find.byType(Column);
      final containerMovementsFinder = find.byType(ContainerMovementsText);
      final listViewMovementsFinder = find.byType(ListViewMovements);

      expect(dividerFinder, findsOneWidget);
      expect(columnFinder, findsOneWidget);
      expect(containerMovementsFinder, findsOneWidget);
      expect(listViewMovementsFinder, findsOneWidget);
    });

    testWidgets('Testing Container Movements', (WidgetTester tester) async {
      await loadPage(tester, const ContainerMovementsText());

      final textFinder = find.byType(Text);
      expect(textFinder, findsOneWidget);
    });
  });
}
