import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/details/controller/days_provider.dart';
import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';

import '../../l10n/core_strings.dart';
import '../../shared/templates/app_bar_default.dart';
import '../../shared/templates/error_body.dart';
import '../../shared/templates/loading_body.dart';
import '../usecase/cryptos_market_data_provider.dart';
import '../widgets/body_details_screen.dart';

class DetailsScreen extends HookConsumerWidget {
  static const route = '/details';
  final CryptoViewData crypto;
  final double singleBalance;
  final List<CryptoViewData> list;
  const DetailsScreen({
    Key? key,
    required this.crypto,
    required this.singleBalance,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marketData = ref.watch(marketDataProvider(crypto.id));
    Future.delayed(Duration.zero, () {
      ref.read(daysProvider.state).state = 5;
    });

    return Scaffold(
        appBar: AppBarDefault(title: CoreString.of(context)!.details),
        body: marketData.when(data: ((data) {
          return BodyDetailsScreen(
              crypto: crypto,
              singleBalance: singleBalance,
              data: data,
              list: list);
        }), error: (error, stackTrace) {
          debugPrint(stackTrace.toString());
          debugPrint(error.toString());
          return ErrorBody(onError: () {
            ref.refresh(marketDataProvider(crypto.id));
          });
        }, loading: () {
          return const LoadingBody();
        }));
  }
}
