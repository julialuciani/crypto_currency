import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/revision/view/conversion_performed_screen.dart';

import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing conversion performed screen', () {
    testWidgets('When body is called then sees if it has all it needs',
        (WidgetTester tester) async {
      await loadPage(tester, const ConversionPerformedScreen());

      final appBarFinder = find.byType(AppBar);
      final iconButtonFinder = find.byType(IconButton);
      final iconCloseFinder = find.byIcon(Icons.close);
      final columnFinder = find.byType(Column);
      final containerFinder = find.byType(Container);
      final iconDoneFinder = find.byIcon(Icons.done);
      final sizedBoxFinder = find.byType(SizedBox);
      final textFinder = find.byType(Text);

      expect(appBarFinder, findsOneWidget);
      expect(iconButtonFinder, findsOneWidget);
      expect(iconCloseFinder, findsOneWidget);
      expect(columnFinder, findsOneWidget);
      expect(containerFinder, findsOneWidget);
      expect(iconDoneFinder, findsOneWidget);
      expect(sizedBoxFinder, findsAtLeastNWidgets(2));
      expect(textFinder, findsAtLeastNWidgets(2));
      await tester.tap(iconCloseFinder);
      await tester.pumpAndSettle();
    });
  });
}
