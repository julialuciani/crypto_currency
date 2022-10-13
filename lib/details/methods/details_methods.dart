import 'package:flutter/material.dart';
import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';

class DetailsMethods {
  static Color changeButtonColor(dynamic daysButton, dynamic days) {
    if (daysButton == days) {
      return Colors.grey.shade300;
    } else {
      return Colors.transparent;
    }
  }

  static double getVariation(CryptosMarkeDataViewData data, int days) {
    return (data.prices.last.last / data.prices.reversed.elementAt(days).last -
            1) *
        100;
  }
}
