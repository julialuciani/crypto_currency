import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/revision/view/revision_screen.dart';
import 'package:projeto_crypto/revision/widgets/body_revision_screen.dart';
import 'package:projeto_crypto/revision/widgets/button_revision_screen.dart';
import 'package:projeto_crypto/revision/widgets/column_revision_infos.dart';
import 'package:projeto_crypto/revision/widgets/row_revision_info.dart';
import 'package:projeto_crypto/revision/widgets/user_text_revision.dart';
import 'package:projeto_crypto/shared/templates/app_bar_default.dart';

import '../helpers/crypto_mock_data.dart';
import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing revision screen', () {
    testWidgets('WHEN RevisionScreen is called THEN expect to find its widgets',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          RevisionScreen(
              cryptos: [crypto, cryptoSecond],
              convertQuantity: '1BTC',
              receiveQuantity: '2 ETH',
              cryptoConvert: crypto,
              cryptoReceive: cryptoSecond,
              total: '1',
              discount: 1,
              increase: 2,
              idDiscount: 'btc',
              idIncrease: 'eth'));
      await tester.pumpAndSettle();
      final scaffoldFinder = find.byType(Scaffold);
      final appBarFinder = find.byType(AppBarDefault);
      final bodyFinder = find.byType(BodyRevision);

      expect(scaffoldFinder, findsWidgets);
      expect(appBarFinder, findsWidgets);
      expect(bodyFinder, findsWidgets);
    });
    testWidgets('WHEN BodyRevision is called THEN expect to find its widgets',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          BodyRevision(
              cryptos: [crypto, cryptoSecond],
              convertQuantity: '0.2',
              receiveQuantity: '0.2',
              cryptoConvert: crypto,
              cryptoReceive: crypto,
              total: '0.2',
              increase: 0.0,
              discount: 0.0,
              idDiscount: 'bitcoin',
              idIncrease: 'bitcoin'));

      await tester.pumpAndSettle();
      final sizedBoxFinder = find.byType(SizedBox);
      expect(sizedBoxFinder, findsAtLeastNWidgets(2));

      final userTextRevision = find.byType(UserTextRevision);
      final columnRevision = find.byType(ColumnRevisionInfo);
      final butttonRevisionScreen = find.byType(ButtonRevisionScreen);

      expect(userTextRevision, findsOneWidget);
      expect(columnRevision, findsOneWidget);
      expect(butttonRevisionScreen, findsOneWidget);
    });

    testWidgets(
        'WHEN ColumnRevisionInfo is called THEN expect to find its widgets',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          ColumnRevisionInfo(
            convertQuantity: '0.2',
            receiveQuantity: '0.2',
            cryptoConvert: crypto,
            cryptoReceive: crypto,
          ));
      final dividerFinder = find.byType(Divider);
      final rowRevisionFinder = find.byType(RowRevisionInfo);

      expect(dividerFinder, findsAtLeastNWidgets(3));
      expect(rowRevisionFinder, findsAtLeastNWidgets(3));
    });

    testWidgets(
        'WHEN ButtonRevisionScreen is called THEN expect to find its widgets and taps it',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          ButtonRevisionScreen(
            convertQuantity: '0.2',
            receiveQuantity: '0.2',
            cryptoConvert: crypto,
            cryptoReceive: cryptoSecond,
            total: '0.2',
            increase: 0.0,
            discount: 0.0,
            idDiscount: 'bitcoin',
            idIncrease: 'ethereum',
            cryptos: [crypto, cryptoSecond],
          ));
      await tester.pumpAndSettle();

      final materialButtonFinder = find.byType(MaterialButton);
      final paddingFinder = find.byType(Padding);
      final textFinder = find.byType(Text);
      final revisionButton = find.byType(ButtonRevisionScreen);
      final ButtonRevisionScreen buttonTester = tester.widget(revisionButton);
      final MaterialButton materialTester = tester.widget(materialButtonFinder);

      expect(materialButtonFinder, findsWidgets);
      expect(paddingFinder, findsWidgets);
      expect(textFinder, findsWidgets);
      expect(revisionButton, findsWidgets);
      expect(buttonTester.convertQuantity, '0.2');
      expect(buttonTester.receiveQuantity, '0.2');
      expect(buttonTester.cryptoConvert.id, crypto.id);
      expect(buttonTester.cryptoReceive.id, cryptoSecond.id);
      expect(buttonTester.total, '0.2');
      expect(buttonTester.increase, 0.0);
      expect(buttonTester.discount, 0.0);
      expect(buttonTester.idDiscount, 'bitcoin');
      expect(buttonTester.idIncrease, 'ethereum');
      expect(materialTester.onPressed != null, true);

      await tester.tap(revisionButton);
      await tester.pumpAndSettle();
    });
  });
}
