import 'package:crypto/portifolio/model/crypto_model_api.dart';

class Arguments {
  CryptoModelApi crypto;
  int? days;

  Arguments({required this.crypto, this.days});
}
