import 'package:flutter/material.dart';

import 'generate_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto',
      theme: ThemeData(primaryColor: Colors.red),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: GeneretaRoute.findRoute,
      initialRoute: '/portifolio',
    );
  }
}
