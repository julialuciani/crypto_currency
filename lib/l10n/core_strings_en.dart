import 'core_strings.dart';

/// The translations for English (`en`).
class CoreStringEn extends CoreString {
  CoreStringEn([String locale = 'en']) : super(locale);

  @override
  String get crypto => 'Crypto';

  @override
  String get total => 'Total coin value';

  @override
  String get port => 'Portifolio';

  @override
  String get move => 'Movements';

  @override
  String prices(int days) {
    return 'Price in the last $days days';
  }

  @override
  String variation(int days) {
    return 'Variation in the last $days days';
  }

  @override
  String get quant => 'Quantity';

  @override
  String get value => 'Value';

  @override
  String get conv => 'Convert coin';

  @override
  String get avai => 'Available balance';

  @override
  String get how => 'How much would you like to convert?';

  @override
  String get totEst => 'Estimated total';

  @override
  String get review => 'Review your conversion data';

  @override
  String get convert => 'Convert';

  @override
  String get receive => 'Receive';

  @override
  String get exc => 'exchange';

  @override
  String get comp => 'Complete conversion';

  @override
  String get sucess => 'Conversion performed';

  @override
  String get sucessM => 'Conversion made successfully!';

  @override
  String get writeS => 'Type something';

  @override
  String get theValue => 'Value cannot start with special character';

  @override
  String get youDont => 'You don\'t have this ammount';

  @override
  String get zero => 'You can\'t convert zero';

  @override
  String get details => 'Details';

  @override
  String get pick => 'Choose a crypto to convert';
}
