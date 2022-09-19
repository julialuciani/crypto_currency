import 'package:decimal/decimal.dart';

class DT {
  static double dt(Decimal number) {
    return double.parse(number.toString());
  }
}
