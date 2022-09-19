import 'package:crypto/conversion/view/conversion_screen.dart';
import 'package:crypto/details/view/details_screen.dart';
import 'package:crypto/movements/view/movements_screen.dart';
import 'package:crypto/portifolio/view/portifolio_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  PortifolioScreen.route: (context) => const PortifolioScreen(),
  MovementsScreen.route: (context) => const MovementsScreen(),
  DetailsScreen.route: (context) => const DetailsScreen(),
  ConversionScreen.route: (context) => const ConversionScreen(),
};
