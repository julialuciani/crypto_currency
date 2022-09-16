import 'package:crypto/movements/view/movements_page.dart';
import 'package:crypto/portifolio/view/portifolio_page.dart';
import 'package:flutter/material.dart';
import '../shared/utils/colors.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
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
