import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/controller/movement_provider.dart';
import '../../shared/templates/bottom_navigation_bar_app.dart';
import '../widgets/body_movements.dart';

class MovementsScreen extends HookConsumerWidget {
  const MovementsScreen({super.key});

  static const route = '/movements';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var movements = ref.watch(movementProvider.state).state;
    return SafeArea(
      child: Scaffold(
        body: BodyMovements(
          movements: movements,
        ),
        bottomNavigationBar: const BottomNavigationBarApp(index: 1),
      ),
    );
  }
}
