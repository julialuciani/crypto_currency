import 'package:projeto_crypto/portifolio/model/crypto_view_data.dart';

class AppArguments {
  final CryptoViewData crypto;
  final double singleBalance;
  final List<CryptoViewData> list;
  AppArguments({
    required this.crypto,
    required this.singleBalance,
    required this.list,
  });
}
