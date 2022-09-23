import 'package:flutter/material.dart';
import '../../shared/templates/bottom_navigation_bar_app.dart';
import '../widgets/body_portifolio_screen.dart';

class PortifolioScreen extends StatelessWidget {
  const PortifolioScreen({Key? key}) : super(key: key);

  static const route = '/portifolio';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: BodyPortifolioScreen(),
        bottomNavigationBar: BottomNavigationBarApp(index: 0),
      ),
    );
  }
}
