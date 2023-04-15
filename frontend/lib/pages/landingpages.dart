import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/authentication/pages/login.dart';

import 'package:intro_slider/intro_slider.dart';



class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const IntroScreenDefault(),
    );
  }
}

class IntroScreenDefault extends StatefulWidget {
  const IntroScreenDefault({Key? key}) : super(key: key);

  @override
  IntroScreenDefaultState createState() => IntroScreenDefaultState();
}

class IntroScreenDefaultState extends State<IntroScreenDefault> {
  List<ContentConfig> listContentConfig = [];

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      const ContentConfig(
        styleTitle: TextStyle(fontFamily: "NanumPenScript", fontSize: 35),
        title: "Track and Order Food",
        styleDescription: TextStyle(fontFamily: "NanumPenScript", fontSize: 22),
        description: " Keep track of your meals and order food with ease .   ",
        pathImage: "assets/images/5.png",
        backgroundColor: Color(0xFFD2FBA4),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        styleTitle: TextStyle(fontFamily: "NanumPenScript", fontSize: 35),
        title: "Simplify Meal Planning",
        styleDescription: TextStyle(fontFamily: "NanumPenScript", fontSize: 22),
        description:
            " Take the stress out of meal planning with our easy-to-use tools. ",
        pathImage: "assets/images/6.png",
        backgroundColor: Color(0xFFFCC883),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        styleTitle: TextStyle(fontFamily: "NanumPenScript", fontSize: 35),
        title: "Achieve your Health Goals",
        styleDescription: TextStyle(fontFamily: "NanumPenScript", fontSize: 22),
        description: "Set and achieve your health goals with biteBuddy. ",
        pathImage: "assets/images/7.png",
        backgroundColor: Color(0xFFFCC883),
      ),
    );
    listContentConfig.add(
      const ContentConfig(
        styleTitle: TextStyle(fontFamily: "NanumPenScript", fontSize: 35),
        title: "Stay on top of your diet",
        styleDescription: TextStyle(fontFamily: "NanumPenScript", fontSize: 22),
        description:
            "Monitor your diet and make healthy choices for a healthy life. ",
        pathImage: "assets/images/7.png",
        backgroundColor: Color(0xFFD2FBA4),
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
    log("End of slides");
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      listContentConfig: listContentConfig,
      onDonePress: onDonePress,
    );
  }
}
