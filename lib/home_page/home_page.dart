import 'package:crypto/movements/view/movements_page.dart';
import 'package:crypto/portifolio/view/portifolio_page.dart';
import 'package:flutter/material.dart';

import '../shared/utils/colors.dart';
import '../shared/utils/design_system/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PortifolioPage(),
    MovementsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/icon_warren.png'),
              ),
              label: 'Portifólio'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/cent.png')),
              label: 'Movimentações'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: magenta,
        onTap: _onItemTapped,
      ),
    );
  }
}
