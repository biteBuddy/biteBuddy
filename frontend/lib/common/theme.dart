import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTheme {
  //Colors for App
  Color primaryColor1 = const Color.fromRGBO(254, 114, 76, 1);
  Color primaryColor2 = const Color.fromARGB(255, 21, 30, 63);

  //Colors for Categories of Restaurant

  Map<String, Color> categoryColor = {
    "fine_dining": const Color.fromARGB(255, 128, 0, 32),
    "Cafe": const Color.fromARGB(255, 150, 121, 105),
    "fast_food": Colors.red,
    "buffet": const Color.fromARGB(255, 218, 165, 32),
    "bistro": const Color.fromARGB(255, 128, 128, 0),
  };
//map for categories
  final Map<String, String> category_Image = {
    "Fine Dining": "fine_dining.jpg",
    "Fast Food": "fast_food.jpg",
    "Cafe": "cafe.jpg",
    "Buffet": "buffet.jpg",
    "Bistro": "bistro.jpg",
  };
  //Map for nutrivalues
  final Map<String, String> nutri_Image = {
    "Mass": "assets/images/mass.png",
    "Calories": "assets/images/calories.png",
    "Protein": "assets/images/proteins.png",
    "Fat": "assets/images/fat.png",
    "Carbohydrates": "assets/images/carbohydrates.png"
  };

  //TextStyles

  TextStyle listTitle = const TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w500,
      letterSpacing: 1,
      fontFamily: "Poppins");
  TextStyle cardTitle = const TextStyle(
      fontSize: 19,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      letterSpacing: 0.5);
  TextStyle pageDesc = const TextStyle(
      fontSize: 16,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w300,
      letterSpacing: 1);
  TextStyle pageTitle = const TextStyle(
      fontSize: 24,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
      wordSpacing: 1);
  TextStyle cardDesc = const TextStyle(
      fontSize: 12,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w300,
      letterSpacing: 1);
  TextStyle priceInfo1 = const TextStyle(
      fontSize: 16,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      color: Color.fromRGBO(254, 114, 76, 1));
  TextStyle priceInfo2 = const TextStyle(
      fontSize: 18,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(254, 114, 76, 1),
      letterSpacing: -1);
  TextStyle totalStyle = const TextStyle(
      fontSize: 18,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      color: Colors.grey,
      letterSpacing: 1);
  TextStyle totalPrice = const TextStyle(
      fontSize: 16,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      letterSpacing: -1);
}
