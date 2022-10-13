import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/details/model/cryptos_market_data_view_data.dart';
import 'package:projeto_crypto/details/usecase/cryptos_market_data_provider.dart';
import 'package:projeto_crypto/generate_routes.dart';
import 'package:projeto_crypto/l10n/core_strings.dart';
import 'package:projeto_crypto/portfolio/model/crypto_view_data.dart';
import 'package:projeto_crypto/portfolio/usecase/cryptos_provider.dart';

import '../../shared/fake_repository.dart';

class SetupWhenWidgetTester extends StatelessWidget {
  final Widget child;
  const SetupWhenWidgetTester({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cryptoProviderFaker = FutureProvider<List<CryptoViewData>>(
        (ref) async => await FakeRepository.getAllCryptos());
    final pricesProviderFaker =
        FutureProviderFamily<CryptosMarkeDataViewData, String>(
            (ref, arg) async => await FakeRepository.getAllMarketData(arg));
    return ProviderScope(
        overrides: [
          cryptosProvider.overrideWithProvider(cryptoProviderFaker),
          marketDataProvider.overrideWithProvider(
              (argument) => pricesProviderFaker(argument)),
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            CoreString.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: const Locale('pt', 'BR'),
          supportedLocales: const [
            Locale('pt', 'BR'),
            Locale('en', ''),
            Locale('es', ''),
          ],
          onGenerateRoute: GenerateRoute.findRoute,
          home: Material(
            child: MediaQuery(
              data: const MediaQueryData(),
              child: child,
            ),
          ),
        ));
  }
}

Future<void> loadPageWhen(WidgetTester tester, Widget child) async {
  var widget = SetupWhenWidgetTester(
    child: child,
  );
  await tester.pumpWidget(widget);
}
