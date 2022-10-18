import 'package:flutter/material.dart';
import 'package:projeto_crypto/l10n/core_strings.dart';

Future<dynamic> bottomSheetWarningUser(BuildContext context) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
    context: context,
    builder: (context) {
      return SizedBox(
        height: 100,
        child: Center(
          child: Text(
            CoreString.of(context)!.sense,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey.shade700),
          ),
        ),
      );
    },
  );
}
