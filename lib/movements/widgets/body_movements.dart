import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/movements/widgets/container_movements.dart';
import 'package:projeto_crypto/movements/widgets/list_view_movements.dart';

import '../../shared/controller/movement_provider.dart';

class BodyMovements extends HookConsumerWidget {
  const BodyMovements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var movements = ref.watch(movementProvider.state).state;

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
