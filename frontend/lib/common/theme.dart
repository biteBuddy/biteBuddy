import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTheme {
  //fonts color and ap

  //Colors for App
  Color primaryColor1 = const Color.fromRGBO(249, 110, 70, 1);
  Color primaryColor2 = const Color.fromARGB(255, 21, 30, 63);

  //Colors for Categories of Restaurant

  Map<String, Color> categoryColor = {
    "fine_dining": const Color.fromARGB(255, 128, 0, 32),
    "Cafe": const Color.fromARGB(255, 150, 121, 105),
    "fast_food": Colors.red,
    "buffet": const Color.fromARGB(255, 218, 165, 32),
    "bistro": const Color.fromARGB(255, 128, 128, 0),
  };

  final Map<String, String> category_Image = {
    "Fine Dining": "fine_dining.jpg",
    "Fast Food": "fast_food.jpg",
    "Cafe": "cafe.jpg",
    "Buffet": "buffet.jpg",
    "Bistro": "bistro.jpg",
  };
}
