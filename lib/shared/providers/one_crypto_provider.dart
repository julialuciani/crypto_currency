import 'package:crypto/shared/providers/variation_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/crypto_model.dart';

var oneCryptoProvider =
    StateNotifierProvider<DetailsCryptoNotifier, CryptoModel>(
  (ref) => DetailsCryptoNotifier(),
);
