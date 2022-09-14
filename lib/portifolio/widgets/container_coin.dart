import 'package:crypto/details/view/details_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:crypto/portifolio/widgets/visible.dart';
import 'package:crypto/shared/models/crypto_model.dart';

import '../../shared/utils/providers/visibility_provider.dart';

class ContainerCoin extends StatefulHookConsumerWidget {
  final CryptoModel crypto;

  const ContainerCoin({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  @override
  ConsumerState<ContainerCoin> createState() => _ContainerCoinState();
}

class _ContainerCoinState extends ConsumerState<ContainerCoin> {
  bool visible = true;

  void changeVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibilityProvider.state);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DetailsPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(widget.crypto.iconImage),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.crypto.abbreviation,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.crypto.name,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
                ),
              ],
            ),
            const Spacer(),
            visible.state
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        NumberFormat.simpleCurrency(
                                locale: 'pt-BR', decimalDigits: 2)
                            .format(double.parse(
                                widget.crypto.quantity.toString())),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            widget.crypto.variation.toString(),
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.crypto.abbreviation,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                : Column(
                    children: const [
                      ContainerVisible(),
                      SizedBox(height: 8),
                      ContainerVisible(),
                    ],
                  ),
            const SizedBox(width: 10),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade500,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
