import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/l10n/core_strings.dart';

class SetupWidgetTester extends StatelessWidget {
  final Widget child;
  const SetupWidgetTester({Key? key, required this.child}) : super(key: key);

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
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', ''),
      ],
      home: Material(
        child: MediaQuery(
          data: const MediaQueryData(),
          child: child,
        ),
      ),
    ));
  }
}

Future<void> loadPage(WidgetTester tester, Widget child) async {
  var widget = SetupWidgetTester(
    child: child,
  );
  await tester.pumpWidget(widget);
}
