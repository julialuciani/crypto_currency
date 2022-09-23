import 'package:flutter/material.dart';

import '../style/colors.dart';

class ButtonDetailsScreen extends StatelessWidget {
  const ButtonDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: magenta,
        onPressed: () {
          Navigator.pushNamed(context, '/conversion');
        },
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
