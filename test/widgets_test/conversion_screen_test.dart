import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:projeto_crypto/conversion/widgets/button_change_coin.dart';
import 'package:projeto_crypto/conversion/widgets/interactive_text.dart';
import 'package:projeto_crypto/conversion/widgets/list_tile_conversion.dart';
import 'package:projeto_crypto/conversion/widgets/total_container.dart';
import 'package:projeto_crypto/conversion/widgets/upper_container_conversion.dart';

import '../helpers/crypto_mock_data.dart';
import '../helpers/setup_widget_tester.dart';

void main() {
  group('Testing conversion screen', () {
    testWidgets('Testing UpperContainer', (WidgetTester tester) async {
      await loadPage(
          tester,
          UpperAvailableBalanceContainer(
              crypto: crypto, singleBalance: cryptoBalance));

      final upperContainerFinder = find.byType(UpperAvailableBalanceContainer);
      final textFinder = find.byType(Text);
      final rowFinder = find.byType(Row);
      final containerFinder = find.byType(Container);

      expect(textFinder, findsAtLeastNWidgets(2));
      expect(rowFinder, findsOneWidget);
      expect(containerFinder, findsOneWidget);
      expect(upperContainerFinder, findsOneWidget);
    });

    testWidgets('Testing total container', (WidgetTester tester) async {
      await loadPage(tester, const TotalContainer(total: '2'));

      final dividerFinder = find.byType(Divider);
      final textFinder = find.byType(Text);
      final containerFinder = find.byType(Container);
      final columnFinder = find.byType(Column);
      final totalFinder = find.byType(TotalContainer);
      final TotalContainer total = tester.widget(totalFinder);
      final Column column = tester.widget(columnFinder);
      final sizedBoxFinder = find.byType(SizedBox);

      expect(column.crossAxisAlignment, CrossAxisAlignment.start);

      expect(columnFinder, findsWidgets);
      expect(containerFinder, findsWidgets);
      expect(dividerFinder, findsWidgets);
      expect(textFinder, findsWidgets);
      expect(totalFinder, findsWidgets);
      expect(total.total, '2');
      expect(sizedBoxFinder, findsWidgets);
    });

    testWidgets('Testing interactive text', (WidgetTester tester) async {
      await loadPage(tester, const InteractiveText());
      final textFinder = find.byType(InteractiveText);
      expect(textFinder, findsOneWidget);
    });

    testWidgets('Testing ButtonChangeCoin has all it needs',
        (WidgetTester tester) async {
      BuildContext context;
      mockNetworkImagesFor(() async {
        await loadPage(
            tester,
            ButtonChangeCoin(
              crypto: crypto,
              data: [crypto, crypto],
              id: '1',
            ));
        await tester.pumpAndSettle();

        final sizedBoxFinder = find.byType(SizedBox);
        final textFinder = find.byType(Text);
        final iconFinder = find.byIcon(Icons.expand_more);
        final imageFinder = find.byType(Image);
        final circleAvatarFinder = find.byType(CircleAvatar);
        final rowFinder = find.byType(Row);
        final buttonFinder = find.byType(ButtonChangeCoin);
        final ButtonChangeCoin button = tester.widget(buttonFinder);
        final containerFinder = find.byType(Container);
        final columnFinder = find.byType(Column);
        final dividerFinder = find.byType(Divider);
        final expandedFinder = find.byType(Expanded);
        final listTileConversionFinder = find.byType(ListTileConversion);
        final listViewFinder = find.byType(ListView);
        final inkWellFinder = find.byType(InkWell);
        final paddingFinder = find.byType(Padding);
        final materialFinder = find.byType(MaterialButton);

        expect(button.data, [crypto, crypto]);
        expect(button.crypto.symbol, 'btc');
        expect(button.crypto.image,
            'https://cdn-icons-png.flaticon.com/512/825/825540.png');
        expect(button.id, '1');
        expect(button.data, [crypto, crypto]);
        expect(rowFinder, findsOneWidget);
        expect(textFinder, findsOneWidget);
        expect(iconFinder, findsOneWidget);
        expect(imageFinder, findsOneWidget);
        expect(circleAvatarFinder, findsOneWidget);
        expect(sizedBoxFinder, findsAtLeastNWidgets(2));
        expect(buttonFinder, findsOneWidget);
        expect(materialFinder, findsWidgets);

        await tester.tap(buttonFinder);
        await tester.pumpAndSettle();

        expect(sizedBoxFinder, findsWidgets);
        expect(containerFinder, findsWidgets);
        expect(rowFinder, findsWidgets);
        expect(columnFinder, findsWidgets);
        expect(textFinder, findsWidgets);
        expect(dividerFinder, findsWidgets);
        expect(expandedFinder, findsWidgets);
        expect(listTileConversionFinder, findsWidgets);
        expect(listViewFinder, findsOneWidget);
        expect(inkWellFinder, findsWidgets);
        expect(paddingFinder, findsWidgets);
      });
    });
  });
}
