import 'core_strings.dart';

/// The translations for Spanish Castilian (`es`).
class CoreStringEs extends CoreString {
  CoreStringEs([String locale = 'es']) : super(locale);

  @override
  String get crypto => 'Cripto';

  @override
  String get total => 'Total en valor de la moneda';

  @override
  String get port => 'Portafolio';

  @override
  String get move => 'Movimientos';

  @override
  String prices(int days) {
    return 'Precio en los ultimos $days dias';
  }

  @override
  String variation(int days) {
    return 'Variación en los ultimos $days dias';
  }

  @override
  String get quant => 'Cantidad';

  @override
  String get value => 'Valor';

  @override
  String get conv => 'Convertir moneda';

  @override
  String get avai => 'Saldo disponible';

  @override
  String get how => '¿Cuánto te gustaría convertir?';

  @override
  String get totEst => 'Total estimado';

  @override
  String get review => 'Revisar sus datos de conversión';

  @override
  String get convert => 'Convertir';

  @override
  String get receive => 'Recibir';

  @override
  String get exc => 'intercambio';

  @override
  String get comp => 'Conversión completa';

  @override
  String get sucess => 'Conversión realizada';

  @override
  String get sucessM => 'Conversión hecha con éxito';

  @override
  String get writeS => 'Escribe algo';

  @override
  String get theValue => 'El valor no puede comenzar con un carácter especial';

  @override
  String get youDont => 'No tienes esta cantidad';

  @override
  String get zero => 'No puedes convertir cero';

  @override
  String get details => 'Detalles';

  @override
  String get pick => 'Elija una criptomoneda para convertir';
}
