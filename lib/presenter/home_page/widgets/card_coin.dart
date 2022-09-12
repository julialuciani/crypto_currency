import 'package:crypto/presenter/home_page/widgets/visible.dart';
import 'package:crypto/presenter/providers/visibility_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class CardCoin extends StatefulHookConsumerWidget {
  final String name;
  final String abbreviation;
  final double price;
  final double variation;
  final String iconImage;

  const CardCoin({
    Key? key,
    required this.name,
    required this.abbreviation,
    required this.price,
    required this.variation,
    this.iconImage = 'assets/icons/Union.png',
  }) : super(key: key);

  @override
  ConsumerState<CardCoin> createState() => _CardCoinState();
}

class _CardCoinState extends ConsumerState<CardCoin> {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              visible.state
                  ? Column(
                      children: [
                        Text(
                          NumberFormat.simpleCurrency(
                                  locale: 'pt-BR', decimalDigits: 2)
                              .format(widget.price),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  : const ContainerVisible(),
              const SizedBox(height: 8),
              visible.state
                  ? Row(
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
                  : const ContainerVisible(),
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
