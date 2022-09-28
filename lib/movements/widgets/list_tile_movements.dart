import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListTileMovements extends StatelessWidget {
  String convertQuantity;
  String receiveQuantity;
  String total;
  DateTime date;
  ListTileMovements({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.total,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            convertQuantity,
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            receiveQuantity,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          )
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('dd/MM/yyyy').format(date),
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            total,
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
