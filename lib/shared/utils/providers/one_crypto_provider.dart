import 'package:crypto/shared/utils/providers/variation_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/crypto_model.dart';

var oneCryptoProvider = StateNotifierProvider<VariationNotifier, CryptoModel>(
  (ref) => VariationNotifier(),
);
