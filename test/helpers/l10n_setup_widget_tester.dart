import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:projeto_crypto/l10n/core_strings.dart';

import 'widgets/internationalized_texts.dart';

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
