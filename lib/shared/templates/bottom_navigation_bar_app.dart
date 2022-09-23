import 'package:flutter/material.dart';
import '../style/colors.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({Key? key, required this.index})
      : super(key: key);
  final int index;
  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(
          context,
          '/portifolio',
        );
        break;
      case 1:
        Navigator.pushNamed(
          context,
          '/movements',
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: magenta,
      currentIndex: widget.index,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/icon_warren.png'),
          ),
          label: 'Portifólio',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/icons/cent.png'),
          ),
          label: 'Movimentações',
        ),
      ],
    );
  }
}
