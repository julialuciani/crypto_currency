// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/app_widget.dart';
import 'package:projeto_crypto/portifolio/widgets/upper_container_crypto.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AppWidget());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  Future<void> loadPage(WidgetTester tester) async {
    const upperContainer = SetupWidgetTester(child: UpperContainerCrypto());
    await tester.pumpWidget(upperContainer);
  }

  testWidgets('VisibilityIcon test', (WidgetTester tester) async {
    await tester.pumpWidget(const UpperContainerCrypto());
    expect(find.byIcon(Icons.visibility), find);
  });

  testWidgets('Find visibility Icon', (WidgetTester tester) async {
    await loadPage(tester);
    final visibilityIcon = find.byType(Icon);
    expect(Icons.visibility, findsOneWidget);
  });
}
