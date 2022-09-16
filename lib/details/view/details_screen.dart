import 'package:crypto/shared/utils/providers/days_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/body_details_screen.dart';

class DetailsScreen extends HookConsumerWidget {
  static const route = '/details';

  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0.5,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(daysProvider.state).state = 24;
            },
            icon: const Icon(Icons.arrow_back_ios)),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 245, 246, 250),
        title: const Text(
          'Detalhes',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: const BodyDetailsScreen(),
    );
  }
}
