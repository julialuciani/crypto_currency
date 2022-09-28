import 'package:flutter/material.dart';

class ContainerMovementsText extends StatelessWidget {
  const ContainerMovementsText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      child: const Text(
        'Movimentações',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, letterSpacing: 1),
      ),
    );
  }
}
