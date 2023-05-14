import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:frontend/Food/model/Food.dart';

import '../Restuarant/model/restaurant.dart';

Dio searchDio = Dio();

class SearchAPI {
  static Future<List<Restaurant>> searchForRestaurant(String search) async {
    try {
      final restros = await searchDio.get(
          "http://localhost:3000/api/v1/restaurant/search",
          queryParameters: {"searchTerm": search});
      return restaurantFromJson(jsonEncode(restros.data['data']));
    } catch (e) {
      throw e;
    }
  }

  static Future<List<Food>> searchForFood(String search) async {
    try {
      final foods = await searchDio.get(
          "http://localhost:3000/api/v1/food/search",
          queryParameters: {"searchTerm": search});
      return FoodFromJson(jsonEncode(foods.data['data']));
    } catch (e) {
      throw e;
    }
  }
}
