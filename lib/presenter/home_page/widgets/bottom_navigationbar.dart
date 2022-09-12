import 'package:flutter/material.dart';

class BottomNavigationBarApp extends StatefulWidget {
  const BottomNavigationBarApp({super.key});

  @override
  State<BottomNavigationBarApp> createState() => _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState extends State<BottomNavigationBarApp> {
  int selectedIndex = 0;

  static const List<Widget> widgetsOptions = <Widget>[
    Text('Index 0: Portifólio'),
    Text('Index 1: Movimentações'),
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
            label: 'Portifólio'),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/Union.png')),
            label: 'Movimentações'),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: const Color.fromARGB(
        255,
        224,
        43,
        87,
      ),
      onTap: onTappedIten,
    );
  }
}
