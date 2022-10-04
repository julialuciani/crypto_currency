import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/revision/widgets/body_revision_screen.dart';
import 'package:projeto_crypto/revision/widgets/button_revision_screen.dart';
import 'package:projeto_crypto/revision/widgets/column_revision_infos.dart';
import 'package:projeto_crypto/revision/widgets/row_revision_info.dart';
import 'package:projeto_crypto/revision/widgets/user_text_revision.dart';

import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing revision screen', () {
    testWidgets('Testing if body contains all widgets it needs',
        (WidgetTester tester) async {
      await loadPage(
          tester,
          BodyRevision(
              convertQuantity: '0.2',
              receiveQuantity: '0.2',
              cryptoConvert: CryptoViewData(
                  id: 'bitcoim',
                  symbol: 'btc',
                  name: 'Bitcoin',
                  image: 'assets/icons/cent.png',
                  currentPrice: 0.0,
                  variation: 0.0),
              cryptoReceive: CryptoViewData(
                  id: 'bitcoim',
                  symbol: 'btc',
                  name: 'Bitcoin',
                  image: 'assets/icons/cent.png',
                  currentPrice: 0.0,
                  variation: 0.0),
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

    testWidgets('Testing Column Revision Infos', (WidgetTester tester) async {
      await loadPage(
          tester,
          ColumnRevisionInfo(
            convertQuantity: '0.2',
            receiveQuantity: '0.2',
            cryptoConvert: CryptoViewData(
                id: 'bitcoim',
                symbol: 'btc',
                name: 'Bitcoin',
                image: 'assets/icons/cent.png',
                currentPrice: 0.0,
                variation: 0.0),
            cryptoReceive: CryptoViewData(
                id: 'bitcoim',
                symbol: 'btc',
                name: 'Bitcoin',
                image: 'assets/icons/cent.png',
                currentPrice: 0.0,
                variation: 0.0),
          ));
      final dividerFinder = find.byType(Divider);
      final rowRevisionFinder = find.byType(RowRevisionInfo);

      expect(dividerFinder, findsAtLeastNWidgets(3));
      expect(rowRevisionFinder, findsAtLeastNWidgets(3));
    });
  });
}
