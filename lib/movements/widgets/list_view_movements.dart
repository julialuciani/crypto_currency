import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/movements/widgets/list_tile_movements.dart';
import 'package:projeto_crypto/shared/controller/movement_provider.dart';

class ListViewMovements extends HookConsumerWidget {
  const ListViewMovements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var movements = ref.watch(movementProvider.state).state;

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
