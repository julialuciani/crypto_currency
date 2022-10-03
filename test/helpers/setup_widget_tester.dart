import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SetupWidgetTester extends StatelessWidget {
  final Widget child;
  const SetupWidgetTester({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp(
      home: Material(
        child: MediaQuery(
          data: const MediaQueryData(),
          child: child,
        ),
      ),
    ));
  }
}
