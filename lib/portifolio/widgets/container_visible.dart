import 'package:flutter/material.dart';

class InvisibleContainer extends StatelessWidget {
  const InvisibleContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 15,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
