import 'package:crypto/presenter/portifolio_page/widgets/card_coin.dart';
import 'package:crypto/presenter/portifolio_page/widgets/upper_card_crypto.dart';
import 'package:flutter/material.dart';

class PortifolioPage extends StatelessWidget {
  const PortifolioPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              UpperCardCrypto(),
              Divider(thickness: 1),
              CardCoin(
                abbreviation: 'BTC',
                name: 'Bitcoin',
                price: 6557.00,
                variation: 0.65,
                iconImage: 'assets/icons/bitecoin.png',
              ),
              Divider(thickness: 1),
              CardCoin(
                abbreviation: 'ETH',
                name: 'Ethereum',
                price: 7996.00,
                variation: 0.94,
                iconImage: 'assets/icons/ethereum.png',
              ),
              Divider(thickness: 1),
              CardCoin(
                abbreviation: 'LTC',
                name: 'Litecoin',
                price: 245.00,
                variation: 0.82,
                iconImage: 'assets/icons/litecoin.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
