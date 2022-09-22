import 'package:projeto_crypto/shared/api/cryptos_endpoint.dart';
import 'package:projeto_crypto/shared/api/models/cryptos/get_all_cryptos_response.dart';

import '../api/models/cryptos/cryptos_response.dart';

class CryptosRepository {
  final CryptosEndpoint _endpoint;

  CryptosRepository(this._endpoint);

  Future<GetAllCryptosResponse> getAllCryptos() async {
    final response = await _endpoint.getAllCryptos();

    return GetAllCryptosResponse(
      List.from(
        response.data.map(
          (crypto) {
            return CryptosResponse.fromMap(crypto);
          },
        ),
      ),
    );
  }
}
