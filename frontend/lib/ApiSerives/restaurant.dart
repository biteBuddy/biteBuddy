import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:frontend/Restuarant/model/restaurant.dart';

Dio restaurantDio = Dio();

class restaurantAPI {
  static Future getRestaurants() async {
    try {
      final response = await restaurantDio
          .get("http://192.168.110.29:3000/api/v1/restaurant/get");
      print("asdf");
      List<Restaurant> _res =
          (restaurantFromJson(jsonEncode(response.data['data'])));
      return _res;
    } catch (e) {
      print(e);
    }
  }
}
