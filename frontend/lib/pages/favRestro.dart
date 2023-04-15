// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/Restuarant/Page/RestaurantCard.dart';

class FavRestro extends StatefulWidget {
  const FavRestro({super.key});

  @override
  State<FavRestro> createState() => _FavRestroState();
}

class _FavRestroState extends State<FavRestro> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RestaurantCard(),
      RestaurantCard(),
      RestaurantCard(),
      RestaurantCard(),
      RestaurantCard(),
      RestaurantCard(),
      RestaurantCard(),
      RestaurantCard(),
      RestaurantCard(),
    ]);
  }
}
