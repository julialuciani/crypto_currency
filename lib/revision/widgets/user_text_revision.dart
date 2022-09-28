import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class UserTextRevision extends StatelessWidget {
  const UserTextRevision({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: AutoSizeText(
        'Revise os dados da sua conversão',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
