import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/details/repository/market_data_repository.dart';
import 'package:projeto_crypto/shared/api/models/endpoints/cryptos_endpoint_provider.dart';

final marketDataRepositoryProvider = Provider(
  (ref) => MarketDataRepository(
    ref.watch(cryptosEndpointProvider),
  ),
);
