import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/topPicks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Text(
          "Hello Username,",
          style: TextStyle(
            color: Colors.green[400],
            fontWeight: FontWeight.w800,
            fontSize: 32,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Excited to explore new foods?",
          style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
        ),
        SizedBox(
          height: 30,
        ),
        TopPicks()
      ]),
    );
  }
}
