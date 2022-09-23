import 'package:flutter/foundation.dart';
import 'package:projeto_crypto/shared/api/models/endpoints/cryptos_endpoint.dart';

import '../../shared/api/models/cryptos_market_data/market_data_response.dart';

class MarketDataRepository {
  final CryptosEndpoint _endpoint;
  MarketDataRepository(this._endpoint);

  Future<MarketDataResponse> getAllCryptosMarketData(String id) async {
    final response = await _endpoint.getAllCryptosMarketData(id);
    debugPrint(response.data);
    return MarketDataResponse.fromJson(response.data);
  }
}
