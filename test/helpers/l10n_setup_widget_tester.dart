import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/l10n/core_strings.dart';

class L10nSetupWidgetTester extends StatelessWidget {
  final Locale locale;
  const L10nSetupWidgetTester({
    Key? key,
    required this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      localizationsDelegates: const [
        CoreString.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', ''),
        Locale('es', ''),
      ],
      home: const Material(
        child: MediaQuery(
          data: MediaQueryData(),
          child: InternationalizedTexts(),
        ),
      ),
    ));
  }
}

class InternationalizedTexts extends StatelessWidget {
  const InternationalizedTexts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(CoreString.of(context)!.crypto),
          Text(CoreString.of(context)!.total),
          Text(CoreString.of(context)!.port),
          Text(CoreString.of(context)!.move),
          Text(CoreString.of(context)!.prices(3)),
          Text(CoreString.of(context)!.variation(3)),
          Text(CoreString.of(context)!.quant),
          Text(CoreString.of(context)!.value),
          Text(CoreString.of(context)!.conv),
          Text(CoreString.of(context)!.avai),
          Text(CoreString.of(context)!.how),
          Text(CoreString.of(context)!.totEst),
          Text(CoreString.of(context)!.receive),
          Text(CoreString.of(context)!.review),
          Text(CoreString.of(context)!.convert),
          Text(CoreString.of(context)!.exc),
          Text(CoreString.of(context)!.comp),
          Text(CoreString.of(context)!.sucess),
          Text(CoreString.of(context)!.sucessM),
          Text(CoreString.of(context)!.writeS),
          Text(CoreString.of(context)!.theValue),
          Text(CoreString.of(context)!.youDont),
          Text(CoreString.of(context)!.zero),
          Text(CoreString.of(context)!.details),
          Text(CoreString.of(context)!.pick),
        ],
      ),
    );
  }
}
