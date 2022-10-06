import 'package:flutter/material.dart';

import '../methods/conversion_methods.dart';
import '../view/conversion_screen.dart';

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
      ConversionMethods.formatLatestValue(ConversionMethods.convertLatestValue(
          valueController.text, widget.crypto)),
      style: TextStyle(
        fontSize: 20,
        color: Colors.grey.shade500,
      ),
    );
  }
}
