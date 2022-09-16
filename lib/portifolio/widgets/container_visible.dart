import 'package:flutter/material.dart';

class ContainerVisible extends StatelessWidget {
  const ContainerVisible({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
