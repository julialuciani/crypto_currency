import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';
import 'package:projeto_crypto/details/repository/market_data_repository_provider.dart';

import 'package:projeto_crypto/details/usecase/cryptos_market_data_usecase.dart';

final marketDataProviderUsecase = Provider(
  (ref) {
    return CryptosMarketDataUsecase(ref.watch(marketDataRepositoryProvider));
  },
);

final marketDataProvider =
    FutureProvider.family<CryptosMarkeDataViewData, String>(
  ((ref, id) {
    return ref.read(marketDataProviderUsecase).execute(id);
  }),
);
