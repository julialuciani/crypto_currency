import 'package:crypto/conversion/view/conversion_screen.dart';
import 'package:crypto/details/view/details_screen.dart';
import 'package:crypto/movements/view/movements_screen.dart';
import 'package:crypto/portifolio/model/crypto_model_api.dart';
import 'package:crypto/portifolio/view/portifolio_screen.dart';
import 'package:flutter/material.dart';

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

class GeneretaRoute {
  static Route<dynamic>? findRoute(settings) {
    if (settings.name == PortifolioScreen.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const PortifolioScreen();
        },
      );
    } else if (settings.name == MovementsScreen.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const MovementsScreen();
        },
      );
    } else if (settings.name == DetailsScreen.route) {
      final args = settings.arguments as CryptoModelApi;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return DetailsScreen(
            crypto: args,
          );
        },
      );
    } else if (settings.name == ConversionScreen.route) {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return const ConversionScreen();
        },
      );
    }
    return null;
  }
}
