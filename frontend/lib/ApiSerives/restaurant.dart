import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:frontend/Restuarant/model/restaurant.dart';

import '../Food/model/Food.dart';

Dio restaurantDio = Dio();

class restaurantAPI {
  static Future getRestaurants() async {
    try {
      final response =
          await restaurantDio.get("http://localhost:3000/api/v1/restaurant");
      List<Restaurant> _res =
          (restaurantFromJson(jsonEncode(response.data['data'])));

      return _res;
    } catch (e) {}
  }
}

class FoodAPI {
  static Future getFoods() async {
    try {
      final response =
          await restaurantDio.get("http://localhost:3000/api/v1/food");

      List<Food> _res = (FoodFromJson(jsonEncode(response.data['data'])));

      return _res;
    } catch (e) {
      print(e);
    }
  }
}
