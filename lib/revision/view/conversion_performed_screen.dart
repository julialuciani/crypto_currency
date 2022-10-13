import 'package:flutter/material.dart';
import 'package:projeto_crypto/l10n/core_strings.dart';

class ConversionPerformedScreen extends StatefulWidget {
  static const route = '/conversion-performed';

  const ConversionPerformedScreen({
    super.key,
  });

  @override
  State<ConversionPerformedScreen> createState() =>
      _ConversionPerformedScreenState();
}

class _ConversionPerformedScreenState extends State<ConversionPerformedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.forward();

    final curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.linear);
    sizeAnimation = Tween<double>(begin: 50, end: 90).animate(curvedAnimation);
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
            Navigator.pushNamed(context, '/movements');
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
                return Container(
                  width: sizeAnimation.value,
                  height: sizeAnimation.value,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 214, 255, 223)),
                  child: const Icon(
                    Icons.done,
                    size: 40,
                    color: Color.fromARGB(255, 104, 167, 125),
                  ),
                );
              }),
          const SizedBox(height: 15),
          Text(
            CoreString.of(context)!.sucess,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 37),
          ),
          const SizedBox(height: 5),
          Text(
            CoreString.of(context)!.sucessM,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 15),
          ),
        ],
      )),
    );
  }
}
