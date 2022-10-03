import 'package:flutter/material.dart';
import '../../l10n/core_strings.dart';
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
      items: [
        BottomNavigationBarItem(
          icon: const ImageIcon(
            AssetImage('assets/icons/icon_warren.png'),
          ),
          label: CoreString.of(context)!.port,
        ),
        BottomNavigationBarItem(
          icon: const ImageIcon(
            AssetImage('assets/icons/cent.png'),
          ),
          label: CoreString.of(context)!.move,
        ),
      ],
    );
  }
}
