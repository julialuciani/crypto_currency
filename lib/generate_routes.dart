import 'package:flutter/material.dart';
import 'package:projeto_crypto/revision/revision_screen.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';
import 'portifolio/view/portifolio_screen.dart';

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
      final args = settings.arguments as AppArguments;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return DetailsScreen(
            crypto: args.crypto,
            singleBalance: args.singleBalance,
          );
        },
      );
    } else if (settings.name == ConversionScreen.route) {
      final args = settings.arguments as AppArguments;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return ConversionScreen(
            crypto: args.crypto,
            singleBalance: args.singleBalance,
          );
        },
      );
    } else if (settings.name == RevisionScreen.route) {
      final args = settings.arguments as AppArguments;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return RevisionScreen(
            crypto: args.crypto,
            singleBalance: args.singleBalance,
          );
        },
      );
    }
    return null;
  }
}
