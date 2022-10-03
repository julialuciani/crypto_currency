// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/portifolio/widgets/listview_crypto.dart';
import 'package:projeto_crypto/portifolio/widgets/upper_container_crypto.dart';

import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing portifolio screen', () {
    testWidgets('Checking icon visibility', (WidgetTester tester) async {
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

    testWidgets('Testing ListView', (WidgetTester tester) async {
      await loadPage(tester, const ListViewCryptos());

      await tester.pumpAndSettle();
      final Finder listViewFinder = find.byType(ListViewCryptos);

      expect(listViewFinder, findsOneWidget);

      await tester.tap(listViewFinder);
      await tester.pumpAndSettle();
    });

    testWidgets('Testing ListTile', (WidgetTester tester) async {});
  });
}
