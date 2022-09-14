import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RowInfos extends StatelessWidget {
  final String title;
  const RowInfos({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade500,
            ),
          ),
          Text(
            NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
                .format(
              double.parse('100745'),
            ),
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
