import 'package:flutter/material.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({super.key});

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int selectedIndex = 0;

  static const List<Widget> widgetsOptions = <Widget>[
    Text('Index 0: Home'),
    Text('Index 1: Carteiras'),
    Text('Index 2: Movimentações'),
  ];

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
            label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Carteiras'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_input_component), label: 'Movimentações'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.red,
      onTap: onTappedIten,
    );
  }
}
