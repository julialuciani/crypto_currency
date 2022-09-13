import 'package:flutter/material.dart';

import '../utils/design_system/colors.dart';

class ButtonDefaultApp extends StatelessWidget {
  const ButtonDefaultApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: magenta,
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Converter Moeda',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
