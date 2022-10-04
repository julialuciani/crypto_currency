import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projeto_crypto/l10n/core_strings.dart';

import 'generate_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto',
      theme: ThemeData(primaryColor: Colors.red),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        CoreString.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', ''),
        Locale('es', ''),
      ],
      onGenerateRoute: GeneretaRoute.findRoute,
      initialRoute: '/portifolio',
    );
  }
}
