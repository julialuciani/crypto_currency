import 'package:crypto/portifolio/model/crypto_model_api.dart';
import 'package:crypto/portifolio/view/portifolio_screen.dart';
import 'package:flutter/material.dart';

import 'conversion/view/conversion_screen.dart';
import 'details/view/details_screen.dart';
import 'movements/view/movements_screen.dart';

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
