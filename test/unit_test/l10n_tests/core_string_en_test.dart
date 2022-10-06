import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/l10n_setup_widget_tester.dart';
import '../../helpers/setup_widget_tester.dart';

void main() {
  testWidgets('Testing english translation', (WidgetTester tester) async {
    await loadPage(
        tester,
        const L10nSetupWidgetTester(
          locale: Locale('en', ''),
        ));
    await tester.pumpAndSettle();

    expect(find.text('Crypto'), findsOneWidget);
    expect(find.text('Total crypto wealth'), findsOneWidget);
    expect(find.text('Portifolio'), findsOneWidget);
    expect(find.text('Movements'), findsOneWidget);
    expect(find.text('Price in the last 3 days'), findsOneWidget);
    expect(find.text('Variation in the last 3 days'), findsOneWidget);
    expect(find.text('Quantity'), findsOneWidget);
    expect(find.text('Value'), findsOneWidget);
    expect(find.text('Convert coin'), findsOneWidget);
    expect(find.text('Available balance'), findsOneWidget);
    expect(find.text('How much would you like to convert?'), findsOneWidget);
    expect(find.text('Estimated total'), findsOneWidget);
    expect(find.text('Review your conversion data'), findsOneWidget);
    expect(find.text('Convert'), findsOneWidget);
    expect(find.text('Receive'), findsOneWidget);
    expect(find.text('Exchange'), findsOneWidget);
    expect(find.text('Complete conversion'), findsOneWidget);
    expect(find.text('Conversion performed'), findsOneWidget);
    expect(find.text('Conversion made successfully!'), findsOneWidget);
    expect(find.text('Type something'), findsOneWidget);
    expect(
        find.text('Value cannot start with special character'), findsOneWidget);
    expect(find.text('You don\'t have this ammount'), findsOneWidget);
    expect(find.text('You can\'t convert zero'), findsOneWidget);
    expect(find.text('Details'), findsOneWidget);
  });
}
