import 'package:crypto/movements/view/movements_page.dart';
import 'package:crypto/portifolio/view/portifolio_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  PortifolioPage.route: (context) => const PortifolioPage(),
  MovementsPage.route: (context) => const MovementsPage(),
};
