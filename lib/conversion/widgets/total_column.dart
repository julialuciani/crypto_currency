import 'package:flutter/material.dart';

class TotalColumn extends StatelessWidget {
  final String total;
  const TotalColumn({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(thickness: 1),
        Text(
          'Total estimado',
          style: TextStyle(color: Colors.grey.shade500, fontSize: 17),
        ),
        const SizedBox(height: 10),
        Text(
          total,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
