import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/widgets/categories.dart';
import 'package:frontend/widgets/topPicks.dart';

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
        child: Padding(
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
              style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
            ),
            const SizedBox(
              height: 30,
            ),
            TopPicks(),
            const SizedBox(
              height: 10,
            ),
            Categories(),
          ]),
        ),
      ),
    );
  }
}
