import 'package:flutter/material.dart';
import 'package:projeto_crypto/portfolio/view/portfolio_screen.dart';

import '../../shared/templates/bottom_navigation_bar_app.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: PortfolioScreen(),
        bottomNavigationBar: BottomNavigationBarApp(index: 0),
      ),
    );
  }
}
