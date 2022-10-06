import 'package:flutter/material.dart';

import 'package:projeto_crypto/movements/view/model/movement_model.dart';
import 'package:projeto_crypto/movements/widgets/list_tile_movements.dart';

class ListViewMovements extends StatelessWidget {
  final List<MovementModel> movements;
  const ListViewMovements({
    Key? key,
    required this.movements,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
        height: 1,
      ),
      itemCount: movements.length,
      itemBuilder: (context, index) {
        return ListTileMovements(
          convertQuantity: movements[index].converted,
          receiveQuantity: movements[index].received,
          total: movements[index].valueInReal,
          date: DateTime.now(),
        );
      },
    );
  }
}
