import 'package:crypto/shared/templates/bottom_navigation_bar_app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/body_portifolio_screen.dart';

class PortifolioScreen extends HookConsumerWidget {
  const PortifolioScreen({Key? key}) : super(key: key);

  static const route = '/portifolio';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SafeArea(
      child: Scaffold(
        body: BodyPortifolioScreen(),
        bottomNavigationBar: BottomNavigationBarApp(index: 0),
      ),
    );
  }
}
