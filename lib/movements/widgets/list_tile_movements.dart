import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ListTileMovements extends StatefulWidget {
  final String convertQuantity;
  final String receiveQuantity;
  final String total;
  final DateTime date;
  const ListTileMovements({
    Key? key,
    required this.convertQuantity,
    required this.receiveQuantity,
    required this.total,
    required this.date,
  }) : super(key: key);

  @override
  State<ListTileMovements> createState() => _ListTileMovementsState();
}

class _ListTileMovementsState extends State<ListTileMovements> {
  late DateFormat dateFormat;

  @override
  void initState() {
    initializeDateFormatting();
    dateFormat = DateFormat.yMd(Platform.localeName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.convertQuantity,
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            widget.receiveQuantity,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          )
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateFormat.format(widget.date),
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
          Text(
            widget.total,
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
