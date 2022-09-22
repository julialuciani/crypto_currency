import 'package:projeto_crypto/details/mapper/cryptos_market_data_mapper.dart';
import 'package:projeto_crypto/details/repository/market_data_repository.dart';

class CryptosMarketDataUsecase {
  final MarketDataRepository _repository;
  CryptosMarketDataUsecase(this._repository);

  Future<List<List<num>>> execute(String id) async {
    final response = await _repository.getAllCryptosMarketData(id);
    return response.toViewData();
  }
}
