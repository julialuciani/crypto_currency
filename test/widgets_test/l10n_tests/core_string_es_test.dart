import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/setup/l10n_setup_widget_tester.dart';
import '../../helpers/setup/setup_widget_tester.dart';

void main() {
  testWidgets('Testing spanish translation', (WidgetTester tester) async {
    await loadPage(
        tester,
        const L10nSetupWidgetTester(
          locale: Locale('es', ''),
        ));
    await tester.pumpAndSettle();

    expect(find.text('Cripto'), findsOneWidget);
    expect(find.text('Total en valor de la moneda'), findsOneWidget);
    expect(find.text('Portafolio'), findsOneWidget);
    expect(find.text('Movimientos'), findsOneWidget);
    expect(find.text('Precio en los ultimos 3 dias'), findsOneWidget);
    expect(find.text('Variación en los ultimos 3 dias'), findsOneWidget);
    expect(find.text('Cantidad'), findsOneWidget);
    expect(find.text('Valor'), findsOneWidget);
    expect(find.text('Convertir moneda'), findsOneWidget);
    expect(find.text('Saldo disponible'), findsOneWidget);
    expect(find.text('¿Cuánto te gustaría convertir?'), findsOneWidget);
    expect(find.text('Total estimado'), findsOneWidget);
    expect(find.text('Revisar sus datos de conversión'), findsOneWidget);
    expect(find.text('Convertir'), findsOneWidget);
    expect(find.text('Recibir'), findsOneWidget);
    expect(find.text('Intercambio'), findsOneWidget);
    expect(find.text('Conversión completa'), findsOneWidget);
    expect(find.text('Conversión realizada'), findsOneWidget);
    expect(find.text('Conversión hecha con éxito'), findsOneWidget);
    expect(find.text('Escribe algo'), findsOneWidget);
    expect(find.text('El valor no puede comenzar con un carácter especial'),
        findsOneWidget);
    expect(find.text('No tienes esta cantidad'), findsOneWidget);
    expect(find.text('No puedes convertir cero'), findsOneWidget);
    expect(find.text('Detalles'), findsOneWidget);
    expect(find.text('Elija una criptomoneda para convertir'), findsOneWidget);
    expect(find.text('No tiene sentido convertir la misma moneda'),
        findsOneWidget);
  });
}
