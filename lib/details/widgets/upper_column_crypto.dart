import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpperColumnCrypto extends StatelessWidget {
  const UpperColumnCrypto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Bitcoin',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/icons/bitecoin.png'),
              ),
            ],
          ),
          Text(
            'BTC',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            NumberFormat.simpleCurrency(locale: 'pt-BR', decimalDigits: 2)
                .format(
              double.parse('100745'),
            ),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}
