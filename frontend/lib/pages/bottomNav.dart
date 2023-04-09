import 'package:flutter/material.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';
import 'homePage.dart';
import 'favorites.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  void _handleTap(int x) {
    setState(() {
      _selectedIndex = x;
    });
  }

  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [
    HomePage(),
    MyWidget2(),
    MyWidget3(),
    Favorites(),
    MyWidget4()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 145, 199, 136),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black,
        selectedIconTheme: IconThemeData(size: 32),
        iconSize: 26,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), label: "Camera"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        onTap: _handleTap,
        unselectedFontSize: 0,
      ),
    );
  }
}
