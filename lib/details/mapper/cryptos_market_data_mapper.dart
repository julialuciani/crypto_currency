import '../../shared/api/models/cryptos_market_data/market_data_response.dart';

extension CryptosMarketDataMapper on MarketDataResponse {
  List<List<num>> toViewData() {
    return List.from(
      prices.map(
        (prices) {
          return prices;
        },
      ),
    );
  }
}
