import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/setup/l10n_setup_widget_tester.dart';
import '../../helpers/setup/setup_widget_tester.dart';

void main() {
  testWidgets('Testing portuguese translation', (WidgetTester tester) async {
    await loadPage(
        tester,
        const L10nSetupWidgetTester(
          locale: Locale('pt', 'BR'),
        ));
    await tester.pumpAndSettle();

    expect(find.text('Cripto'), findsOneWidget);
    expect(find.text('Valor total de moedas'), findsOneWidget);
    expect(find.text('Portfólio'), findsOneWidget);
    expect(find.text('Movimentos'), findsOneWidget);
    expect(find.text('Preço nos últimos 3 dias'), findsOneWidget);
    expect(find.text('Variação nos últimos 3 dias'), findsOneWidget);
    expect(find.text('Quantidade'), findsOneWidget);
    expect(find.text('Valor'), findsOneWidget);
    expect(find.text('Converter moeda'), findsOneWidget);
    expect(find.text('Saldo disponível'), findsOneWidget);
    expect(find.text('Quanto você gostaria de converter?'), findsOneWidget);
    expect(find.text('Total estimado'), findsOneWidget);
    expect(find.text('Revise os dados da sua conversão'), findsOneWidget);
    expect(find.text('Converter'), findsOneWidget);
    expect(find.text('Receber'), findsOneWidget);
    expect(find.text('Câmbio'), findsOneWidget);
    expect(find.text('Concluir conversão'), findsOneWidget);
    expect(find.text('Conversão efetuada'), findsOneWidget);
    expect(
        find.text('Conversão de moeda efetuada com sucesso!'), findsOneWidget);
    expect(find.text('Digite algo'), findsOneWidget);
    expect(find.text('O valor não pode começar com um caractere especial'),
        findsOneWidget);
    expect(find.text('Você não tem essa quantia'), findsOneWidget);
    expect(find.text('Você não pode converter zero'), findsOneWidget);
    expect(find.text('Detalhes'), findsOneWidget);
    expect(find.text('Escolha uma moeda para converter'), findsOneWidget);
  });
}
