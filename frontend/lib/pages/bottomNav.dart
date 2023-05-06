// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontend/Cart/pages/CartMain.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/search/searchPage.dart';
import 'page2.dart';
import 'profile.dart';
import 'homePage.dart';
import '../Favorites/pages/favorites.dart';

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
  final List<Widget> _widgetOptions = [
    HomePage(),
    CartMain(),
    Search(),
    Favorites(),
    // ProfileSection()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: CustomTheme().primaryColor1,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(size: 32),
          iconSize: 26,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: ".",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_rounded,
              ),
              label: ".",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: ".",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined),
              label: ".",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person),
            //   label: ".",
            // ),
          ],
          currentIndex: _selectedIndex,
          onTap: _handleTap,
          unselectedFontSize: 0,
        ),
      ),
    );
  }
}
