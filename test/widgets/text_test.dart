import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/setup_widget_tester.dart';

void main() {
  testWidgets('Testing texts', (WidgetTester tester) async {
    await tester.pumpWidget(const SetupWidgetTester(child: Text('')));
    await tester.pumpAndSettle();

    final Finder textFinder = find.byType(Text);

    expect(textFinder, findsWidgets);
    tester.widget(textFinder);

    await tester.tap(find.byType(Text));
    await tester.pump();
  });
}
