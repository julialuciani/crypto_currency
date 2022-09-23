import 'package:flutter/material.dart';

import '../../shared/templates/bottom_navigation_bar_app.dart';

class MovementsScreen extends StatelessWidget {
  const MovementsScreen({super.key});

  static const route = '/movements';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('soon'),
        ),
        bottomNavigationBar: BottomNavigationBarApp(index: 1),
      ),
    );
  }
}
