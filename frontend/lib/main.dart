import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:frontend/pages/favorites.dart';
import 'package:frontend/pages/homePage.dart';
import 'package:frontend/pages/page2.dart';
import 'package:frontend/pages/page3.dart';
import 'package:frontend/pages/page4.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.workSansTextTheme(Theme.of(context)
            .textTheme
            .copyWith(bodyText1: TextStyle(fontSize: 20))),
      ),
      home: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
    return SafeArea(
      child: Scaffold(
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
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt), label: "Camera"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outlined), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(EvaIcons.person), label: "Profile"),
          ],
          currentIndex: _selectedIndex,
          onTap: _handleTap,
          unselectedFontSize: 0,
        ),
      ),
    );
  }
}
