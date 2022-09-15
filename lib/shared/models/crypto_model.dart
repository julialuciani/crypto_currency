import 'dart:core';

import 'package:decimal/decimal.dart';

class CryptoModel {
  int id;
  String name;
  String abbreviation;
  Decimal howMuchUserHave;
  Decimal quantity;
  double variation;
  Decimal currentPrice;
  String iconImage;
  List<Decimal> priceInOne;
  List<Decimal> priceInNinety;

  CryptoModel({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.howMuchUserHave,
    required this.quantity,
    required this.variation,
    required this.currentPrice,
    required this.iconImage,
    required this.priceInOne,
    required this.priceInNinety,
  });
}
