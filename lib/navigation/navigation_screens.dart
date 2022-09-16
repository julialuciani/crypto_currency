import 'package:crypto/movements/view/movements_screen.dart';
import 'package:crypto/portifolio/view/portifolio_screen.dart';
import 'package:flutter/material.dart';
import '../shared/style/colors.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  late int _selectedIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _selectedIndex);
  }

  void changePage(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: PageView(
        onPageChanged: changePage,
        controller: pageController,
        children: const [
          PortifolioScreen(),
          MovementsScreen(),
        ],
      ),
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
        onTap: (page) {
          pageController.animateToPage(page,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn);
        },
      ),
    );
  }
}
