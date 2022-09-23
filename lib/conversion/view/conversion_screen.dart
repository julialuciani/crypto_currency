import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:projeto_crypto/details/widgets/details_app_bar.dart';
import 'package:projeto_crypto/shared/style/colors.dart';

import '../widgets/button_change_coin.dart';

class ConversionScreen extends StatelessWidget {
  static const route = '/conversion';
  TextEditingController value = TextEditingController();

  ConversionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DetailsAppBar(
          title: 'Converter',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 245, 245, 250),
                height: MediaQuery.of(context).size.height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Saldo disponível',
                      style:
                          TextStyle(fontSize: 15, color: Colors.grey.shade600),
                    ),
                    const Text('0,65 BTC'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const AutoSizeText(
                'Quanto você gostaria de converter?',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ButtonChangeCoin(
                    image: 'assets/icons/bitecoin.png',
                    abbreviation: 'BTC',
                  ),
                  Icon(
                    Icons.sync_alt,
                    color: magenta,
                  ),
                  ButtonChangeCoin(
                    image: 'assets/icons/ethereum.png',
                    abbreviation: 'ETH',
                  ),
                ],
              ),
              TextFormField(
                controller: value,
                decoration: const InputDecoration(
                  hintText: 'BTC 0,00',
                  hintStyle: TextStyle(fontSize: 40),
                ),
              ),
              const Text('0,00'),
            ],
          ),
        ));
  }
}
