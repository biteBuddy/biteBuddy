import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/ApiSerives/cart.dart';
import 'package:frontend/ApiSerives/restaurant.dart';
import 'package:frontend/Cart/model/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Food/model/Food.dart';
import '../model/restaurant.dart';

class RestaurantsProvider extends ChangeNotifier {
  // list of cart items
  List<Restaurant> restaurants = [];
  SharedPreferences? sharedPreferences;

  Future getRestaurant() async {
    restaurants = await restaurantAPI.getRestaurants();
  }
}
