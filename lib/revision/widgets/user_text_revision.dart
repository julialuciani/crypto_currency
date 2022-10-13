import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crypto/l10n/core_strings.dart';

class UserTextRevision extends StatelessWidget {
  const UserTextRevision({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      CoreString.of(context)!.review,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
