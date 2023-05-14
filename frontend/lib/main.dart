import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:frontend/Cart/pages/checkoutPage.dart';
import 'package:frontend/Cart/provider/CartProvider.dart';
import 'package:frontend/Favorites/provider/favProvider.dart';

import 'package:frontend/pages/landingpages.dart';
import 'package:frontend/splashScreen/loadinScreen.dart';

void main() {
  Stripe.publishableKey =
      "pk_test_51MSI9dAkl1eBY46uH19GDjulKm1oXQpLQO7CkPd5Qk9JBHtqOoVWpwaCg5t4e1XEeUIlbRCI5ha4K0bUAOyw5TRN00WWl2by6U";
  runApp(const ProviderScope(child: MyApp()));
}

final FavRestroProvider = ChangeNotifierProvider(((ref) => FavProvider()));

final CartProvider = ChangeNotifierProvider(((ref) => Cart()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'biteBuddy',
      home: MainApp(),
      initialRoute: '/',
      routes: {
        '/cart/checkout': (context) => Checkout(),
      },
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
