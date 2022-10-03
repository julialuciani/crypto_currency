import 'package:flutter/material.dart';

class ListTileConversion extends StatelessWidget {
  final String symbol;
  final String name;
  const ListTileConversion({
    Key? key,
    required this.symbol,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(symbol),
      subtitle: Text(name),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15,
        color: Colors.grey.shade500,
      ),
    );
  }
}
