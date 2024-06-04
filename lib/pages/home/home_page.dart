import 'package:flutter/material.dart';
import 'package:texasgrill_app/pages/menu/menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Texas Grill Archena',
        style: TextStyle(color: Theme.of(context).colorScheme.tertiary),),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Página 1',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          const MenuPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            
            icon: Icon(Icons.discount),
            label: 'Promociones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menú',
          ),
        ],
      ),
    );
  }
}