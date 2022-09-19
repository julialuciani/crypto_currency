import 'package:flutter/material.dart';
import 'package:crypto/shared/routes/app_routes.dart';

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
