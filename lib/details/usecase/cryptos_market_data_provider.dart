import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';
import 'package:projeto_crypto/details/repository/market_data_repository_provider.dart';

import 'package:projeto_crypto/details/usecase/cryptos_market_data_usecase.dart';

final marketDataProviderUsecase = Provider(
  (ref) {
    return CryptosMarketDataUsecase(ref.read(marketDataRepositoryProvider));
  },
);

final marketDataProvider =
    FutureProvider.family<CryptosMarkeDataViewData, DetailsArguments>(
  ((ref, args) {
    return ref.read(marketDataProviderUsecase).execute(args.id);
  }),
);

class DetailsArguments {
  String id;
  DetailsArguments({
    required this.id,
  });
}
