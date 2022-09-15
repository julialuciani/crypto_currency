import 'package:crypto/movements/view/movements_page.dart';
import 'package:crypto/portifolio/view/portifolio_page.dart';
import 'package:flutter/material.dart';
import '../shared/utils/design_system/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
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
          PortifolioPage(),
          MovementsPage(),
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
