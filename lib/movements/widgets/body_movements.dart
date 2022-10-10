import 'package:flutter/material.dart';
import 'package:projeto_crypto/movements/widgets/container_movements.dart';
import 'package:projeto_crypto/movements/widgets/list_view_movements.dart';

class BodyMovements extends StatelessWidget {
  const BodyMovements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ContainerMovementsText(),
          Divider(
            thickness: 1,
            height: 0,
          ),
          Expanded(child: ListViewMovements()),
        ],
      ),
    );
  }
}
