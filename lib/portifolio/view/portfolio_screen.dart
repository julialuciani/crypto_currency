import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/templates/error_body.dart';
import '../../shared/templates/loading_body.dart';
import '../controller/balance_provider.dart';
import '../controller/crypto_individual_balance_notifier.dart';
import '../methods/portifolio_methods.dart';
import '../usecase/cryptos_provider.dart';
import '../widgets/body_portifolio_screen.dart';

class PortfolioScreen extends HookConsumerWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  static const route = '/portifolio';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptos = ref.watch(cryptosProvider);
    final singleBalance = ref.watch(singleBalanceProvider);

    return cryptos.when(data: (data) {
      Future.delayed(Duration.zero, () {
        ref.read(balanceProvider.state).state =
            PortifolioMethods.getBalance(data, singleBalance);
      });
      return BodyPortifolioScreen(
          data: cryptos.asData!.value, singleBalance: singleBalance);
    }, error: (e, r) {
      return ErrorBody(onError: () {
        ref.refresh(cryptosProvider);
      });
    }, loading: () {
      return const LoadingBody();
    });
  }
}
