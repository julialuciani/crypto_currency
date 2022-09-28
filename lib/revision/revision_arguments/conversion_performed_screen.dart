import 'package:flutter/material.dart';

class ConversionPerformedScreen extends StatelessWidget {
  static const route = '/conversion-performed';

  const ConversionPerformedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0.5,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
            )),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 245, 246, 250),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/icons/concluded.png'),
          ),
          const SizedBox(height: 15),
          const Text(
            'Conversão efetuada',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 37),
          ),
          const SizedBox(height: 5),
          Text(
            'Conversão de moeda efetuada com sucesso!',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
          ),
        ],
      )),
    );
  }
}
