import 'package:crypto/shared/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      initialRoute: '/portifolio',
    );
  }
}
