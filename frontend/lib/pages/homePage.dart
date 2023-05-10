// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontend/Food/Page/FoodSlider.dart';
import 'package:frontend/Restuarant/Page/RestaurantSlider.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/widgets/categories.dart';
import 'package:frontend/widgets/topPicks.dart';
import '../ApiSerives/restaurant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //   colors: [Color(0xff3f51b5), Color(0xff673ab7)],
            //   stops: [0, 1],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // )),
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "Hello Username,",
                style: TextStyle(
                    color: CustomTheme().primaryColor1,
                    fontWeight: FontWeight.w800,
                    fontSize: 32,
                    fontFamily: "Poppins"),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Excited to explore new foods?",
                style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18,
                    fontFamily: "Poppins"),
              ),
              const SizedBox(
                height: 30,
              ),
              TopPicks(),
              const SizedBox(
                height: 15,
              ),
              Categories(),
              const SizedBox(
                height: 15,
              ),
              ResSlider(),
              const SizedBox(
                height: 15,
              ),
              FoodSlider()
            ]),
          ),
        ),
      ),
    );
  }
}
