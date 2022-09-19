import 'package:crypto/shared/models/crypto_model.dart';

class Arguments {
  CryptoModel crypto;
  int? days;

  Arguments({required this.crypto, this.days});
}
