import 'package:flutter/material.dart';

import 'package:projeto_crypto/movements/model/movement_model.dart';
import 'package:projeto_crypto/movements/widgets/container_movements.dart';
import 'package:projeto_crypto/movements/widgets/list_view_movements.dart';

class BodyMovements extends StatelessWidget {
  final List<MovementModel> movements;
  const BodyMovements({
    Key? key,
    required this.movements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ContainerMovementsText(),
          const Divider(
            thickness: 1,
            height: 0,
          ),
          Expanded(
              child: ListViewMovements(
            movements: movements,
          )),
        ],
      ),
    );
  }
}
