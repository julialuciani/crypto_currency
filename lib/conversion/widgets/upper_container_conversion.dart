import 'package:flutter/material.dart';

import '../view/conversion_screen.dart';

class UpperContainerConversion extends StatelessWidget {
  const UpperContainerConversion({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ConversionScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 245, 245, 250),
      height: MediaQuery.of(context).size.height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Saldo disponível',
            style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
          ),
          Text(
            '0.5 ${widget.crypto.symbol.toUpperCase()}',
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
