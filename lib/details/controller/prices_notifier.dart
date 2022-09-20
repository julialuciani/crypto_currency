import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../repository/graphic_crypto_repository.dart';

var gambiarra = StateProvider((ref) => []);

//StateNotifier
var pricesProvider = StateNotifierProvider<PricesNotifier, List<double>>(
  (ref) => PricesNotifier(),
);

//Notifier
class PricesNotifier extends StateNotifier<List<double>> {
  PricesNotifier() : super([]);

  Future<void> getPriceRange(String id, int days) async {
    GraphicCryptoRepository repository = GraphicCryptoRepository(Dio());

    state = await repository.getDaysData(id, days);
  }
}
