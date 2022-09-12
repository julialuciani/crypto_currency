import 'package:crypto/presenter/home_page/widgets/bottom_navigationbar.dart';
import 'package:crypto/presenter/home_page/widgets/card_coin.dart';
import 'package:crypto/presenter/home_page/widgets/divider_app.dart';
import 'package:crypto/presenter/home_page/widgets/visible.dart';
import 'package:crypto/presenter/providers/visibility_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

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
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 45, bottom: 5),
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Cripto',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(224, 43, 87, 1)),
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
                      ? Text(
                          NumberFormat.simpleCurrency(
                                  locale: 'pt-BR', decimalDigits: 2)
                              .format(14798.00),
                          style: const TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const ContainerVisible(),
                  const SizedBox(height: 5),
                  Text(
                    'Valor total de moedas',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
                  ),
                ],
              ),
            ),
            const DividerApp(),
            const CardCoin(
              abbreviation: 'BTC',
              name: 'Bitcoin',
              price: 6557.00,
              variation: 0.65,
              iconImage: 'assets/icons/bitecoin.png',
            ),
            const DividerApp(),
            const CardCoin(
              abbreviation: 'ETH',
              name: 'Ethereum',
              price: 7996.00,
              variation: 0.94,
              iconImage: 'assets/icons/ethereum.png',
            ),
            const DividerApp(),
            const CardCoin(
              abbreviation: 'LTC',
              name: 'Litecoin',
              price: 245.00,
              variation: 0.82,
              iconImage: 'assets/icons/litecoin.png',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarApp(),
    );
  }
}
