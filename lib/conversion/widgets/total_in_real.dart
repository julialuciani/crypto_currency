import 'package:flutter/material.dart';
import 'package:projeto_crypto/conversion/methods/conversion_screen_methods.dart';
import 'package:projeto_crypto/conversion/view/conversion_screen.dart';

class TotalInReal extends StatelessWidget {
  const TotalInReal({
    Key? key,
    required this.valueController,
    required this.widget,
  }) : super(key: key);

  final TextEditingController valueController;
  final ConversionScreen widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      ConversionMethods.formatLatestValue(
          ConversionMethods.convertLatestValue(valueController, widget.crypto)),
      style: TextStyle(
        fontSize: 20,
        color: Colors.grey.shade500,
      ),
    );
  }
}
