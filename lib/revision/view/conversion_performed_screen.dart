import 'dart:math';

import 'package:flutter/material.dart';

class ConversionPerformedScreen extends StatefulWidget {
  static const route = '/conversion-performed';

  const ConversionPerformedScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ConversionPerformedScreen> createState() =>
      _ConversionPerformedScreenState();
}

class _ConversionPerformedScreenState extends State<ConversionPerformedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0.5,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/portifolio');
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 245, 246, 250),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller.view,
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * pi,
                child: child,
              );
            },
            child: Image.asset('assets/icons/concluded.png'),
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
