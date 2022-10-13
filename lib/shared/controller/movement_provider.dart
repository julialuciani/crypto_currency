import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../movements/model/movement_model.dart';

final movementProvider = StateProvider<List<MovementModel>>(
  (ref) {
    return [];
  },
);
