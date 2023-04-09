
import 'package:flutter/material.dart';
import 'login.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'biteBuddy',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('biteBuddy'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: ElevatedButton(
            child: const Text(
              'Touch Me!',
              style: TextStyle(fontSize: 24.0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ),
      ),
    );
  }
}
