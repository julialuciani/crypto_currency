import 'dart:convert';

class CryptoModelApi {
  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  double priceChangeOneDay;

  CryptoModelApi({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.priceChangeOneDay,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'symbol': symbol});
    result.addAll({'name': name});
    result.addAll({'image': image});
    result.addAll({'current_price': currentPrice});
    result.addAll({'price_change_percentage_24h': priceChangeOneDay});

    return result;
  }

  factory CryptoModelApi.fromMap(Map<String, dynamic> map) {
    return CryptoModelApi(
      id: map['id'] ?? '',
      symbol: map['symbol'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      currentPrice: map['current_price']?.toDouble() ?? 0.0,
      priceChangeOneDay: map['price_change_percentage_24h']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoModelApi.fromJson(String source) =>
      CryptoModelApi.fromMap(json.decode(source));
}
