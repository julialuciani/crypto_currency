import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:projeto_crypto/details/widgets/details_app_bar.dart';
import 'package:projeto_crypto/shared/style/colors.dart';
import 'package:projeto_crypto/shared/utils/currency_formatter.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color.fromARGB(255, 245, 245, 250),
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Saldo disponível',
                    style: TextStyle(fontSize: 17, color: Colors.grey.shade600),
                  ),
                  const Text(
                    '0,65 BTC',
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
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
                  Icons.compare_arrows,
                  color: magenta,
                ),
                ButtonChangeCoin(
                  image: 'assets/icons/ethereum.png',
                  abbreviation: 'ETH',
                ),
              ],
            ),
            TextFormField(
              showCursor: false,
              controller: value,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: magenta,
                    width: 3,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: magenta, width: 3)),
                hintText: 'BTC 0,00',
                hintStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              FormatCurrency.format(0.00),
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey.shade500,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.32),
            const Divider(thickness: 1),
            Text(
              'Total estimado',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 17),
            ),
            const SizedBox(height: 10),
            const Text(
              '0,0000 ETH',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 202, 200, 212),
        onPressed: () {},
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
