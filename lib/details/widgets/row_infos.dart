import 'package:flutter/material.dart';

class RowInfos extends StatelessWidget {
  final String title;
  String info;
  final Color? color;
  final bool isVariation;

  RowInfos({
    Key? key,
    required this.title,
    required this.info,
    this.color = Colors.black,
    this.isVariation = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade500,
            ),
          ),
          Text(
            info,
            style: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: isVariation ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
