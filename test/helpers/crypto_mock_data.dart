import 'package:projeto_crypto/movements/view/model/movement_model.dart';
import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

CryptoViewData crypto = CryptoViewData(
    id: 'bitcoin',
    symbol: 'btc',
    name: 'Bitcoin',
    image: 'https://cdn-icons-png.flaticon.com/512/825/825540.png',
    currentPrice: 2.0,
    variation: 0.0);
CryptoViewData cryptoSecond = CryptoViewData(
    id: 'ethereum',
    symbol: 'btc',
    name: 'Bitcoin',
    image: 'https://cdn-icons-png.flaticon.com/512/825/825540.png',
    currentPrice: 2.0,
    variation: 0.0);

double cryptoBalance = 5;

MovementModel movement = MovementModel(
    converted: '',
    received: '',
    date: DateTime.now(),
    valueInReal: '',
    discount: 0,
    increase: 0,
    idDiscount: '',
    idIncrease: '');
