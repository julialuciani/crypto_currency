import 'package:flutter/material.dart';

import '../../l10n/core_strings.dart';

class ContainerMovementsText extends StatelessWidget {
  const ContainerMovementsText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: Text(
        CoreString.of(context)!.move,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: 1),
      ),
    );
  }
}
