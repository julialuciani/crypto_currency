import 'package:crypto/shared/utils/bottom_navigation_bar_app.dart';
import 'package:flutter/material.dart';

class MovementsPage extends StatelessWidget {
  const MovementsPage({super.key});

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
