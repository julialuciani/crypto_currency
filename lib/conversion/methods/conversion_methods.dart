import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

import '../../revision/revision_arguments/revision_arguments_screen.dart';
import '../widgets/bottom_sheet_warning_user.dart';

class ConversionMethods {
  static String formattingValue(String value) {
    return value.replaceAll(RegExp(r'[^\w\s]+'), '.');
  }

  static bool isCorrect(String value) {
    return !value.startsWith(RegExp(r'[!@#$%^&*()-/+.,?":{}|<>]'));
  }

  static double convertLatestValue(
      String valueController, CryptoViewData crypto) {
    double value = 0.0;
    if (valueController == '' || valueController == '.') {
      value = 0.0;
    } else {
      value = double.parse(valueController) * crypto.currentPrice;
    }
    return value;
  }

  static String formatLatestValue(double price) {
    String value = NumberFormat.simpleCurrency(
            locale: Platform.localeName == 'pt_BR' ? 'pt_BR' : 'en',
            decimalDigits: 2)
        .format(price);
    return value;
  }

  static String getTotal(CryptoViewData crypto, double convert) {
    if (convert == 0.0) {
      return '0.00 ${crypto.symbol.toUpperCase()}';
    }
    double total = convert / crypto.currentPrice;
    return '${total.toStringAsFixed(10)} ${crypto.symbol.toUpperCase()}';
  }

  static bool validation(CryptoViewData crypto, CryptoViewData model,
      BuildContext context, TextEditingController valueController) {
    if (model == crypto) {
      bottomSheetWarningUser(context);
      return false;
    } else {
      Navigator.of(context).pushNamed(
        '/revision',
        arguments: RevisionArguments(
          convertQuantity: valueController.text,
          cryptoConvert: model,
          cryptoReceive: crypto,
          receiveQuantity: ConversionMethods.getTotal(
              crypto,
              ConversionMethods.convertLatestValue(
                  valueController.text, model)),
          total: ConversionMethods.formatLatestValue(
              ConversionMethods.convertLatestValue(
                  valueController.text, model)),
          discount: double.parse(valueController.text),
          increase: ConversionMethods.convertLatestValue(
              valueController.text, crypto),
          idDiscount: model.id,
          idIncrease: crypto.id,
        ),
      );
      return true;
    }
  }
}
