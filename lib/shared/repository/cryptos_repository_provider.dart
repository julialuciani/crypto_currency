import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/shared/api/cryptos_endpoint_provider.dart';
import 'package:projeto_crypto/shared/repository/cryptos_repository.dart';

final cryptosRepositoryProvider = Provider(
  (ref) {
    return CryptosRepository(
      ref.watch(cryptosEndpointProvider),
    );
  },
);
