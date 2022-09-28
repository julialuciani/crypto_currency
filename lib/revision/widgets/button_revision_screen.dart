import 'package:flutter/material.dart';
import 'package:projeto_crypto/shared/style/colors.dart';

class ButtonRevisionScreen extends StatelessWidget {
  const ButtonRevisionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: magenta,
      onPressed: () {
        Navigator.pushNamed(context, '/conversion-performed');
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Text(
          'Concluir conversão',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
