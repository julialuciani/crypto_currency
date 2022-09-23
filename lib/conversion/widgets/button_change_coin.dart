import 'package:flutter/material.dart';

class ButtonChangeCoin extends StatelessWidget {
  final String image;
  final String abbreviation;
  const ButtonChangeCoin({
    Key? key,
    required this.image,
    required this.abbreviation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Colors.grey.shade300)),
      onPressed: () {},
      child: Row(
        children: [
          CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(
              image,
            ),
          ),
          const SizedBox(width: 8),
          Text(abbreviation),
          const SizedBox(width: 2),
          const Icon(Icons.expand_more),
        ],
      ),
    );
  }
}
