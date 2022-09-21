import 'package:crypto/portifolio/model/crypto_model_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var balanceProvider =
    StateNotifierProvider<BalanceNotifier, double>((ref) => BalanceNotifier());

class BalanceNotifier extends StateNotifier<double> {
  BalanceNotifier() : super(0.0);

  void getBalance(List<CryptoModelApi> cryptos) {
    for (CryptoModelApi crypto in cryptos) {
      state += crypto.currentPrice * 0.5;
    }
  }
}
