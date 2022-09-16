import 'package:crypto/details/controller/variation_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/crypto_model.dart';

var oneCryptoProvider =
    StateNotifierProvider<DetailsCryptoNotifier, CryptoModel>(
  (ref) => DetailsCryptoNotifier(),
);
