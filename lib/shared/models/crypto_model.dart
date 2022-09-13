import 'dart:core';

import 'package:decimal/decimal.dart';

class CryptoModel {
  int id;
  String name;
  String abbreviation;
  Decimal quantity;
  Decimal variation;
  String iconImage;

  CryptoModel({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.quantity,
    required this.variation,
    required this.iconImage,
  });
}
