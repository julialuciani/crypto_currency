import 'package:crypto/presenter/home_page/widgets/bottom_navigationbar.dart';
import 'package:crypto/presenter/home_page/widgets/card_coin.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool visible = true;

  void changeVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                          changeVisibility();
                        },
                        icon: Icon(
                            visible ? Icons.visibility : Icons.visibility_off),
                      ),
                    ],
                  ),
                  visible
                      ? const Text(
                          'US\$ 1.0000,00',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
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
