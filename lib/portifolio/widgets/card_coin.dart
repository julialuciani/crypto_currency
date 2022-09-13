import 'package:crypto/portifolio/widgets/visible.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../shared/utils/providers/visibility_provider.dart';

class ContainerCoin extends StatefulHookConsumerWidget {
  final String name;
  final String abbreviation;
  final Decimal price;
  final Decimal variation;
  final String iconImage;

  const ContainerCoin({
    Key? key,
    required this.name,
    required this.abbreviation,
    required this.price,
    required this.variation,
    required this.iconImage,
  }) : super(key: key);

  @override
  ConsumerState<ContainerCoin> createState() => _CardCoinState();
}

class _CardCoinState extends ConsumerState<ContainerCoin> {
  bool visible = true;

  void changeVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibilityProvider.state);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(widget.iconImage),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.abbreviation,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8),
              Text(
                widget.name,
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
                          .format(double.parse(widget.price.toString())),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          widget.variation.toString(),
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.abbreviation,
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
    );
  }
}
