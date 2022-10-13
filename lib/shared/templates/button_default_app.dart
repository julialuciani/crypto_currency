import 'package:flutter/material.dart';

import 'package:projeto_crypto/shared/utils/app_arguments.dart';

import '../style/colors.dart';

class ButtonDefaulApp extends StatelessWidget {
  final AppArguments arguments;
  final String route;
  final String label;
  const ButtonDefaulApp({
    Key? key,
    required this.route,
    required this.arguments,
    required this.label,
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
        onPressed: () {
          Navigator.pushNamed(context, route, arguments: arguments);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
