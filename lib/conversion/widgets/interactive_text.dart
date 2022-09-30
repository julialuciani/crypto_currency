import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crypto/l10n/core_strings.dart';

class InteractiveText extends StatelessWidget {
  const InteractiveText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: AutoSizeText(
        CoreString.of(context)!.how,
        maxLines: 2,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
