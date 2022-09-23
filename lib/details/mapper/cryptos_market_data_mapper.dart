import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';

import '../../shared/api/models/cryptos_market_data/market_data_response.dart';

extension CryptosMarketDataMapper on MarketDataResponse {
  CryptosMarkeDataViewData toViewData() {
    return CryptosMarkeDataViewData(
      List.from(
        prices.map(
          (price) {
            return price;
          },
        ),
      ),
    );
  }
}
