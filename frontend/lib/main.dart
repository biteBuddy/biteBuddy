
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/Favorites/provider/favProvider.dart';
import 'package:frontend/pages/landingpages.dart';
import 'package:frontend/splashScreen/loadinScreen.dart';
import './authentication/pages/login.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final FavRestroProvider = ChangeNotifierProvider(((ref) => FavProvider()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'biteBuddy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Poppins",
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
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3000), (() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const LandingPage())));
    }));
  }

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const Center(child: LoadinScreen()),
      ),
    );
  }
}
