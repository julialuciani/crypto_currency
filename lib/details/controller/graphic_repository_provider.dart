import 'package:crypto/details/repository/graphic_crypto_repository.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

var graphicProvider = StateProvider(
  (ref) => GraphicCryptoRepository(Dio()),
);
