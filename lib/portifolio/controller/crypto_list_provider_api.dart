import 'package:crypto/portifolio/model/crypto_model_api.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repositories/crypto_repository.dart';

var listCryptosProvider =
    StateNotifierProvider<GetListNotifier, List<CryptoModelApi>>(
  (ref) => GetListNotifier(CryptoRepository(Dio())),
);

class GetListNotifier extends StateNotifier<List<CryptoModelApi>> {
  GetListNotifier(this.repository) : super([]);

  final CryptoRepository repository;

  Future<void> getAllCryptos() async {
    state = await repository.getAllCryptos();
  }
}
