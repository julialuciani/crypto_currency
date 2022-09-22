import 'package:projeto_crypto/portifolio/mapper/cryptos_mapper.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/shared/repository/cryptos_repository.dart';

class CryptosUsecase {
  final CryptosRepository _repository;
  CryptosUsecase(this._repository);

  Future<List<CryptoViewData>> execute() async {
    final response = await _repository.getAllCryptos();
    return response.toViewData();
  }
}
