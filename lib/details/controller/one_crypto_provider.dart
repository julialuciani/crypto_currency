import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/crypto_model.dart';
import 'details_crypto_notifier.dart';

var oneCryptoProvider =
    StateNotifierProvider<DetailsCryptoNotifier, CryptoModel>(
  (ref) => DetailsCryptoNotifier(),
);
