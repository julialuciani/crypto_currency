import 'package:crypto/presenter/home_page/widgets/bottom_navigationbar.dart';
import 'package:crypto/presenter/home_page/widgets/card_coin.dart';
import 'package:crypto/presenter/home_page/widgets/visible.dart';
import 'package:crypto/presenter/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibilityProvider.state);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.only(top: 35, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Carteira',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            visible.state = !visible.state;
                          });
                        },
                        icon: Icon(visible.state
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ],
                  ),
                  visible.state
                      ? const Text(
                          'US\$ 1.0000,00',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const ContainerVisible(),
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 2,
            ),
            CardCoin(
              abbreviation: 'ETH',
              name: 'Ethereum',
              price: 0.00,
              variation: double.parse('75'),
            ),
            const Divider(
              height: 1,
              thickness: 2,
            ),
            CardCoin(
              abbreviation: 'BTC',
              name: 'Bitcoin',
              price: 1000.00,
              variation: double.parse('75'),
            ),
            const Divider(
              height: 1,
              thickness: 2,
            ),
            CardCoin(
              abbreviation: 'LTC',
              name: 'Litecoin',
              price: 0.00,
              variation: double.parse('0.7'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarApp(),
    );
  }
}
