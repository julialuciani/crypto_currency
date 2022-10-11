import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/portfolio/usecase/cryptos_usecase.dart';
import 'package:projeto_crypto/portfolio/repository/cryptos_repository_provider.dart';

final cryptosProviderUsecase = Provider(
  (ref) {
    return CryptosUsecase(
      ref.watch(cryptosRepositoryProvider),
    );
  },
);

final cryptosProvider = FutureProvider<List<CryptoViewData>>(
  (ref) {
    return ref.read(cryptosProviderUsecase).execute();
  },
);
