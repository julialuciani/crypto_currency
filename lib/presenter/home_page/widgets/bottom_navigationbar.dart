import 'package:crypto/shared/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({super.key});

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int selectedIndex = 0;

  void onTappedIten(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: selectedIndex,
      selectedItemColor: magenta,
      onTap: onTappedIten,
    );
  }
}
