import 'package:flutter/material.dart';
import 'package:projeto_crypto/details/view/details_page.dart';
import 'package:projeto_crypto/portfolio/view/portfolio_page.dart';
import 'package:projeto_crypto/revision/revision_arguments/revision_arguments_screen.dart';
import 'package:projeto_crypto/revision/view/conversion_performed_screen.dart';
import 'package:projeto_crypto/revision/view/revision_screen.dart';
import 'package:projeto_crypto/shared/utils/app_arguments.dart';

import 'conversion/view/conversion_screen.dart';
import 'movements/view/movements_screen.dart';

class GenerateRoute {
  static Route<dynamic>? findRoute(settings) {
    if (settings.name == PortfolioPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const PortfolioPage();
        },
      );
    } else if (settings.name == MovementsScreen.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const MovementsScreen();
        },
      );
    } else if (settings.name == DetailsPage.route) {
      final args = settings.arguments as AppArguments;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return DetailsPage(
            crypto: args.crypto,
            list: args.list,
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
            list: args.list,
          );
        },
      );
    } else if (settings.name == RevisionScreen.route) {
      final args = settings.arguments as RevisionArguments;
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) {
          return RevisionScreen(
            convertQuantity: args.convertQuantity,
            cryptoConvert: args.cryptoConvert,
            cryptoReceive: args.cryptoReceive,
            receiveQuantity: args.receiveQuantity,
            cryptos: args.cryptos,
          );
        },
      );
    } else if (settings.name == ConversionPerformedScreen.route) {
      return PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 250),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation = CurvedAnimation(parent: animation, curve: Curves.ease);
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.center,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return const ConversionPerformedScreen();
        },
      );
    }
    return null;
  }
}
