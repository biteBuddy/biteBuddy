// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:frontend/common/theme.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    var _selectedIndex = 0;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Favorites",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 26),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlutterToggleTab(
                width: MediaQuery.of(context).size.width / 4.5,
                borderRadius: 20,
                labels: ["Retaurants", "Foods"],
                selectedLabelIndex: ((index) {
                  print(index);
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
                selectedTextStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
                selectedBackgroundColors: [CustomTheme().primaryColor1],
                unSelectedBackgroundColors: [Colors.white70],
                unSelectedTextStyle: TextStyle(
                    color: CustomTheme().primaryColor1,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
                selectedIndex: _selectedIndex),
          ],
        ),
      ),
    );
  }
}
