import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class InteractiveText extends StatelessWidget {
  const InteractiveText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: AutoSizeText(
        'Quanto você gostaria de converter?',
        maxLines: 2,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
