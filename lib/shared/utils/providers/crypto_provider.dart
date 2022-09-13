import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/crypto_model.dart';

final cryptosListProvider = Provider(
  (ref) => [
    CryptoModel(
      id: 0,
      name: 'Bitcoin',
      abbreviation: 'BTC',
      quantity: Decimal.parse('6557.00'),
      variation: Decimal.parse('0.65'),
      iconImage: 'assets/icons/bitecoin.png',
    ),
    CryptoModel(
      id: 1,
      name: 'Ethereum',
      abbreviation: 'ETH',
      quantity: Decimal.parse('7996.00'),
      variation: Decimal.parse('0.94'),
      iconImage: 'assets/icons/ethereum.png',
    ),
    CryptoModel(
      id: 2,
      name: 'Litecoin',
      abbreviation: 'LTC',
      quantity: Decimal.parse('245.00'),
      variation: Decimal.parse('0.82'),
      iconImage: 'assets/icons/litecoin.png',
    ),
    CryptoModel(
      id: 3,
      name: 'Bitcoin',
      abbreviation: 'BTC',
      quantity: Decimal.parse('6557.00'),
      variation: Decimal.parse('0.65'),
      iconImage: 'assets/icons/bitecoin.png',
    ),
    CryptoModel(
      id: 4,
      name: 'Ethereum',
      abbreviation: 'ETH',
      quantity: Decimal.parse('7996.00'),
      variation: Decimal.parse('0.94'),
      iconImage: 'assets/icons/ethereum.png',
    ),
    CryptoModel(
      id: 5,
      name: 'Litecoin',
      abbreviation: 'LTC',
      quantity: Decimal.parse('245.00'),
      variation: Decimal.parse('0.82'),
      iconImage: 'assets/icons/litecoin.png',
    ),
    CryptoModel(
      id: 6,
      name: 'Bitcoin',
      abbreviation: 'BTC',
      quantity: Decimal.parse('6557.00'),
      variation: Decimal.parse('0.65'),
      iconImage: 'assets/icons/bitecoin.png',
    ),
    CryptoModel(
      id: 7,
      name: 'Ethereum',
      abbreviation: 'ETH',
      quantity: Decimal.parse('7996.00'),
      variation: Decimal.parse('0.94'),
      iconImage: 'assets/icons/ethereum.png',
    ),
    CryptoModel(
      id: 8,
      name: 'Litecoin',
      abbreviation: 'LTC',
      quantity: Decimal.parse('245.00'),
      variation: Decimal.parse('0.82'),
      iconImage: 'assets/icons/litecoin.png',
    ),
    CryptoModel(
      id: 9,
      name: 'Bitcoin',
      abbreviation: 'BTC',
      quantity: Decimal.parse('6557.00'),
      variation: Decimal.parse('0.65'),
      iconImage: 'assets/icons/bitecoin.png',
    ),
    CryptoModel(
      id: 10,
      name: 'Ethereum',
      abbreviation: 'ETH',
      quantity: Decimal.parse('7996.00'),
      variation: Decimal.parse('0.94'),
      iconImage: 'assets/icons/ethereum.png',
    ),
    CryptoModel(
      id: 11,
      name: 'Litecoin',
      abbreviation: 'LTC',
      quantity: Decimal.parse('245.00'),
      variation: Decimal.parse('0.82'),
      iconImage: 'assets/icons/litecoin.png',
    ),
  ],
);
