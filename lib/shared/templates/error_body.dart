import 'package:flutter/material.dart';
import 'package:projeto_crypto/shared/style/colors.dart';

class ErrorBody extends StatelessWidget {
  final void Function()? onError;

  const ErrorBody({
    Key? key,
    required this.onError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Erro',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: magenta, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const Icon(
            Icons.warning,
            size: 80,
            color: magenta,
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: onError,
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: magenta,
              child: Icon(
                Icons.sync,
                size: 40,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
