import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final singleBalanceProvider =
    StateNotifierProvider<SingleBalanceNotifier, List<double>>(
  (ref) => SingleBalanceNotifier(),
);

class SingleBalanceNotifier extends StateNotifier<List<double>> {
  SingleBalanceNotifier() : super([]) {
    for (double lenght = 0; lenght < 100; lenght++) {
      state.add(Random().nextDouble() * 25);
    }
  }
}
