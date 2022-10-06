import 'package:flutter/material.dart';

class DetailsMethods {
  static Color changeButtonColor(dynamic daysButton, dynamic days) {
    if (daysButton == days) {
      return Colors.grey.shade300;
    } else {
      return Colors.transparent;
    }
  }
}
