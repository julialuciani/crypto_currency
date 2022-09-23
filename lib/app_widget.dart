import 'package:flutter/material.dart';

import 'generate_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Crypto',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: GeneretaRoute.findRoute,
      initialRoute: '/portifolio',
    );
  }
}
