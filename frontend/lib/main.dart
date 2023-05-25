import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/Cart/pages/checkoutPage.dart';
import 'package:frontend/Cart/provider/CartProvider.dart';
import 'package:frontend/Favorites/provider/favProvider.dart';
import 'package:frontend/Restuarant/provider/restaurantProvider.dart';

import 'package:frontend/pages/landingpages.dart';
import 'package:frontend/splashScreen/loadinScreen.dart';

final FavRestroProvider = ChangeNotifierProvider(((ref) => FavProvider()));

final CartProvider = ChangeNotifierProvider(((ref) => Cart()));

final AddressProvider = ChangeNotifierProvider(((ref) => AdressProv()));
// ignore: non_constant_identifier_names
final RestroProvider = ChangeNotifierProvider((ref) => RestaurantsProvider());
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'biteBuddy',
      home: MainApp(),
      initialRoute: '/',
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
