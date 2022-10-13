class ApiFactory {
  static String getAllPrices() =>
      ''' {"prices":[[1633046400000,238735.1279439887],[1633132800000,258548.76626639924]]}''';

  static String getAllCryptos() => '''[
        {
          "id": "bitcoin",
          "symbol": "btc",
          "name": "Bitcoin",
          "image":
              "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
          "current_price": 105741,
          "market_cap": 2024003575363,
          "market_cap_rank": 1,
          "fully_diluted_valuation": 2217788900234,
          "total_volume": 198607145121,
          "high_24h": 108864,
          "low_24h": 103795,
          "price_change_24h": 1426.2,
          "price_change_percentage_24h": 1.3672,
          "market_cap_change_24h": 24022221941,
          "market_cap_change_percentage_24h": 1.20112,
          "circulating_supply": 19165068.0,
          "total_supply": 21000000.0,
          "max_supply": 21000000.0,
          "ath": 380542,
          "ath_change_percentage": -72.22598,
          "ath_date": "2021-11-09T04:09:45.771Z",
          "atl": 149.66,
          "atl_change_percentage": 70521.98036,
          "atl_date": "2013-07-05T00:00:00.000Z",
          "roi": null,
          "last_updated": "2022-09-30T19:06:43.948Z"
        }
      ]''';
}
