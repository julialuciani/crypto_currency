import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/crypto_model.dart';

final cryptosListProvider = Provider(
  (ref) => [
    CryptoModel(
      id: 0,
      name: 'Bitcoin',
      abbreviation: 'BTC',
      howMuchUserHave: Decimal.parse('6557.00'),
      quantity: Decimal.parse('0.65554321'),
      variation: 0.50,
      iconImage: 'assets/icons/bitecoin.png',
      currentPrice: Decimal.parse('100754'),
      priceInOne: [
        Decimal.parse('19800'),
        Decimal.parse('19899'),
        Decimal.parse('20000'),
        Decimal.parse('19900'),
        Decimal.parse('20000.50'),
        Decimal.parse('20000.49'),
      ],
      priceInNinety: [
        Decimal.parse('3000'),
        Decimal.parse('3000.50'),
        Decimal.parse('10000'),
        Decimal.parse('100'),
        Decimal.parse('20000'),
        Decimal.parse('5000'),
        Decimal.parse('9000'),
        Decimal.parse('10000'),
        Decimal.parse('5000'),
        Decimal.parse('900'),
        Decimal.parse('8000'),
        Decimal.parse('15000'),
        Decimal.parse('190000'),
        Decimal.parse('7600'),
        Decimal.parse('254000'),
        Decimal.parse('3550'),
        Decimal.parse('57070'),
        Decimal.parse('6000'),
        Decimal.parse('4700'),
        Decimal.parse('2440'),
        Decimal.parse('230'),
        Decimal.parse('50400'),
        Decimal.parse('13000'),
        Decimal.parse('1040'),
        Decimal.parse('200005'),
        Decimal.parse('3000'),
        Decimal.parse('50400'),
        Decimal.parse('15000'),
        Decimal.parse('13300'),
        Decimal.parse('20000'),
        Decimal.parse('3000'),
        Decimal.parse('5000'),
        Decimal.parse('103000'),
        Decimal.parse('1500'),
        Decimal.parse('20000'),
        Decimal.parse('30020'),
        Decimal.parse('5000'),
        Decimal.parse('10000'),
        Decimal.parse('100'),
        Decimal.parse('20000'),
        Decimal.parse('3000'),
        Decimal.parse('45000'),
        Decimal.parse('10000'),
        Decimal.parse('100'),
        Decimal.parse('20000'),
        Decimal.parse('3000'),
        Decimal.parse('5000'),
        Decimal.parse('100300'),
        Decimal.parse('100'),
        Decimal.parse('20000'),
        Decimal.parse('3000'),
        Decimal.parse('50400'),
        Decimal.parse('10000'),
        Decimal.parse('100'),
        Decimal.parse('20000'),
        Decimal.parse('3000'),
        Decimal.parse('50400'),
        Decimal.parse('10000'),
        Decimal.parse('1050'),
        Decimal.parse('20000'),
        Decimal.parse('3000'),
        Decimal.parse('5000'),
        Decimal.parse('10000'),
        Decimal.parse('100'),
        Decimal.parse('2053000'),
        Decimal.parse('3000'),
        Decimal.parse('5000'),
        Decimal.parse('100300'),
        Decimal.parse('100'),
        Decimal.parse('204000'),
        Decimal.parse('3000'),
        Decimal.parse('5000'),
        Decimal.parse('10000'),
        Decimal.parse('1400'),
        Decimal.parse('20000'),
        Decimal.parse('30300'),
        Decimal.parse('5000'),
        Decimal.parse('100400'),
        Decimal.parse('100'),
        Decimal.parse('200300'),
        Decimal.parse('3000'),
        Decimal.parse('50400'),
        Decimal.parse('103000'),
        Decimal.parse('1040'),
        Decimal.parse('200300'),
        Decimal.parse('30400'),
        Decimal.parse('50300'),
        Decimal.parse('109000'),
        Decimal.parse('2100'),
        Decimal.parse('230000'),
      ],
    ),
    CryptoModel(
      id: 1,
      name: 'Ethereum',
      abbreviation: 'ETH',
      howMuchUserHave: Decimal.parse('7996.00'),
      quantity: Decimal.parse('0.94'),
      variation: 1.41,
      iconImage: 'assets/icons/ethereum.png',
      currentPrice: Decimal.parse('8248.29'),
      priceInOne: [
        Decimal.parse('19800'),
        Decimal.parse('19899'),
        Decimal.parse('20000'),
        Decimal.parse('19900'),
        Decimal.parse('20000.50'),
        Decimal.parse('20000.49'),
      ],
      priceInNinety: [
        Decimal.parse('1940'),
        Decimal.parse('305'),
        Decimal.parse('6000'),
        Decimal.parse('10003'),
        Decimal.parse('200'),
        Decimal.parse('2003'),
        Decimal.parse('3400'),
        Decimal.parse('6400'),
        Decimal.parse('34000'),
        Decimal.parse('23300'),
        Decimal.parse('2020'),
        Decimal.parse('300'),
        Decimal.parse('6020'),
        Decimal.parse('1000'),
        Decimal.parse('2050'),
        Decimal.parse('200'),
        Decimal.parse('3020'),
        Decimal.parse('600'),
        Decimal.parse('1000'),
        Decimal.parse('200'),
        Decimal.parse('2040'),
        Decimal.parse('300'),
        Decimal.parse('3600'),
        Decimal.parse('1000'),
        Decimal.parse('200'),
        Decimal.parse('20330'),
        Decimal.parse('300'),
        Decimal.parse('60320'),
        Decimal.parse('1000'),
        Decimal.parse('20330'),
        Decimal.parse('200'),
        Decimal.parse('30330'),
        Decimal.parse('63300'),
        Decimal.parse('13000'),
        Decimal.parse('2300'),
        Decimal.parse('20330'),
        Decimal.parse('3030'),
        Decimal.parse('6030'),
        Decimal.parse('10500'),
        Decimal.parse('2030'),
        Decimal.parse('2040'),
        Decimal.parse('3040'),
        Decimal.parse('6060'),
        Decimal.parse('12000'),
        Decimal.parse('2040'),
        Decimal.parse('2080'),
        Decimal.parse('300'),
        Decimal.parse('6070'),
        Decimal.parse('10400'),
        Decimal.parse('2070'),
        Decimal.parse('200'),
        Decimal.parse('300'),
        Decimal.parse('60330'),
        Decimal.parse('1000'),
        Decimal.parse('200'),
        Decimal.parse('2050'),
        Decimal.parse('300'),
        Decimal.parse('60044'),
        Decimal.parse('1000'),
        Decimal.parse('20440'),
        Decimal.parse('200'),
        Decimal.parse('300'),
        Decimal.parse('600'),
        Decimal.parse('6600'),
        Decimal.parse('200'),
        Decimal.parse('200'),
        Decimal.parse('300'),
        Decimal.parse('60440'),
        Decimal.parse('1000'),
        Decimal.parse('200'),
        Decimal.parse('24500'),
        Decimal.parse('300'),
        Decimal.parse('600'),
        Decimal.parse('10400'),
        Decimal.parse('200'),
        Decimal.parse('200'),
        Decimal.parse('3040'),
        Decimal.parse('600'),
        Decimal.parse('10400'),
        Decimal.parse('200'),
        Decimal.parse('20440'),
        Decimal.parse('300'),
        Decimal.parse('6040'),
        Decimal.parse('1000'),
        Decimal.parse('200'),
        Decimal.parse('20440'),
        Decimal.parse('300'),
        Decimal.parse('64400'),
        Decimal.parse('1000'),
        Decimal.parse('200'),
      ],
    ),
    CryptoModel(
      id: 2,
      name: 'Litecoin',
      abbreviation: 'LTC',
      howMuchUserHave: Decimal.parse('245.00'),
      quantity: Decimal.parse('58.9'),
      variation: 1.77,
      iconImage: 'assets/icons/litecoin.png',
      currentPrice: Decimal.parse('306.98'),
      priceInOne: [
        Decimal.parse('19800'),
        Decimal.parse('19899'),
        Decimal.parse('20000'),
        Decimal.parse('19900'),
        Decimal.parse('20000.50'),
        Decimal.parse('20000.49'),
      ],
      priceInNinety: [
        Decimal.parse('26600'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('5440'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('15550'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('17700'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('15550'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('9055'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('10770'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('15330'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('504'),
        Decimal.parse('1400'),
        Decimal.parse('2600'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('2600'),
        Decimal.parse('9460'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1400'),
        Decimal.parse('200'),
        Decimal.parse('690'),
        Decimal.parse('150'),
        Decimal.parse('560'),
        Decimal.parse('100'),
        Decimal.parse('2060'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1060'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1560'),
        Decimal.parse('50'),
        Decimal.parse('1060'),
        Decimal.parse('2400'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1500'),
        Decimal.parse('200'),
        Decimal.parse('950'),
        Decimal.parse('150'),
        Decimal.parse('550'),
        Decimal.parse('100'),
        Decimal.parse('2050'),
        Decimal.parse('90'),
        Decimal.parse('150'),
        Decimal.parse('550'),
        Decimal.parse('100'),
        Decimal.parse('200'),
        Decimal.parse('90'),
        Decimal.parse('1550'),
        Decimal.parse('50'),
        Decimal.parse('100'),
        Decimal.parse('2500'),
        Decimal.parse('90'),
        Decimal.parse('1550'),
        Decimal.parse('5770'),
        Decimal.parse('100'),
        Decimal.parse('2060'),
        Decimal.parse('9770'),
        Decimal.parse('150'),
        Decimal.parse('50'),
        Decimal.parse('1700'),
      ],
    ),
  ],
);
