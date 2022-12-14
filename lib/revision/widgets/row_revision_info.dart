import 'package:flutter/material.dart';

class RowRevisionInfo extends StatelessWidget {
  final String label;
  final String data;
  const RowRevisionInfo({
    Key? key,
    required this.label,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
          ),
          Text(
            data,
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
