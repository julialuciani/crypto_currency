import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

class AppArguments {
  final CryptoViewData crypto;
  final double singleBalance;
  AppArguments({
    required this.crypto,
    required this.singleBalance,
  });
}
