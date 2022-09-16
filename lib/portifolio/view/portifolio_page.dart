import 'package:crypto/shared/utils/bottom_navigation_bar_app.dart';
import 'package:crypto/shared/utils/providers/crypto_list_provider.dart';
import 'package:crypto/portifolio/widgets/upper_container_crypto.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/listview_crypto.dart';

class PortifolioPage extends StatefulHookConsumerWidget {
  const PortifolioPage({Key? key}) : super(key: key);

  static const route = '/portifolio';

  @override
  ConsumerState<PortifolioPage> createState() => _PortifolioPageState();
}

class _PortifolioPageState extends ConsumerState<PortifolioPage> {
  @override
  Widget build(BuildContext context) {
    final cryptos = ref.watch(cryptosListProvider);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const UpperContainerCrypto(),
            const Divider(
              thickness: 1,
              height: 0.5,
            ),
            ListViewCryptos(cryptos: cryptos),
          ],
        ),
        bottomNavigationBar: const BottomNavigationBarApp(index: 0),
      ),
    );
  }
}
