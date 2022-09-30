import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:projeto_crypto/portifolio/controller/crypto_individual_balance_notifier.dart';
import '../../shared/templates/bottom_navigation_bar_app.dart';
import '../widgets/body_portifolio_screen.dart';

class PortifolioScreen extends StatefulHookConsumerWidget {
  const PortifolioScreen({Key? key}) : super(key: key);

  static const route = '/portifolio';

  @override
  ConsumerState<PortifolioScreen> createState() => _PortifolioScreenState();
}

class _PortifolioScreenState extends ConsumerState<PortifolioScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref.watch(singleBalanceProvider);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: BodyPortifolioScreen(),
        bottomNavigationBar: BottomNavigationBarApp(index: 0),
      ),
    );
  }
}
