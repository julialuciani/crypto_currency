import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

var balanceProvider =
    StateNotifierProvider<BalanceNotifier, double>((ref) => BalanceNotifier());

class BalanceNotifier extends StateNotifier<double> {
  BalanceNotifier() : super(0.0);

  void getBalance(List<CryptoViewData> cryptos) {
    for (CryptoViewData crypto in cryptos) {
      state += crypto.currentPrice * 0.5;
    }
  }
}
