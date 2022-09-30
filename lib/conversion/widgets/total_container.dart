import 'package:flutter/material.dart';

import '../../l10n/core_strings.dart';

class TotalContainer extends StatelessWidget {
  final String total;
  const TotalContainer({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(thickness: 1),
          Text(
            CoreString.of(context)!.totEst,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 17),
          ),
          const SizedBox(height: 10),
          Text(
            total,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
