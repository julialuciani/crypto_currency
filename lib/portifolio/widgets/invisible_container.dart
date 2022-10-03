import 'package:flutter/material.dart';

class InvisibleContainer extends StatelessWidget {
  final double? width;
  const InvisibleContainer({
    Key? key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 150,
      height: 18,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
