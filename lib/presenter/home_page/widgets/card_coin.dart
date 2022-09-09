import 'package:crypto/presenter/home_page/widgets/visible.dart';
import 'package:crypto/presenter/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardCoin extends StatefulHookConsumerWidget {
  final String name;
  final String abbreviation;
  final double price;
  final double variation;
  const CardCoin({
    Key? key,
    required this.name,
    required this.abbreviation,
    required this.price,
    required this.variation,
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

  Color colorPicker(double percentage) {
    if (percentage > 1) {
      return const Color.fromRGBO(160, 244, 224, 1);
    } else {
      return const Color.fromRGBO(247, 161, 161, 1);
    }
  }

  String addingSignals(double percentage) {
    if (percentage > 1) {
      return '+$percentage%';
    } else {
      return '-$percentage%';
    }
  }

  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibilityProvider.state);

    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
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
                  ? Text(
                      widget.price.toString(),
                      style: const TextStyle(fontSize: 18),
                    )
                  : const ContainerVisible(),
              const SizedBox(height: 8),
              visible.state
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: colorPicker(
                            double.parse((widget.variation).toString())),
                      ),
                      child: Text(
                        addingSignals(
                            double.parse((widget.variation).toString())),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )
                  : const ContainerVisible(),
            ],
          ),
        ],
      ),
    );
  }
}
