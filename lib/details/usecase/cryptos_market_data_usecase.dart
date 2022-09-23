import 'package:projeto_crypto/details/mapper/cryptos_market_data_mapper.dart';
import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';
import 'package:projeto_crypto/details/repository/market_data_repository.dart';

class CryptosMarketDataUsecase {
  final MarketDataRepository _repository;
  CryptosMarketDataUsecase(this._repository);

  Future<CryptosMarkeDataViewData> execute(String id) async {
    final response = await _repository.getAllCryptosMarketData(id);
    return response.toViewData();
  }
}
