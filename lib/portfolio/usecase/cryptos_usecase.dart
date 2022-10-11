import 'package:projeto_crypto/portfolio/mapper/cryptos_mapper.dart';
import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/portfolio/repository/cryptos_repository.dart';

class CryptosUsecase {
  final CryptosRepository _repository;
  CryptosUsecase(this._repository);

  Future<List<CryptoViewData>> execute() async {
    final response = await _repository.getAllCryptos();
    return response.toViewData();
  }
}
