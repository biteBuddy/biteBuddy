import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/Food/model/Food.dart';
import 'dart:convert';

Dio foodDio = Dio();

class FoodAPI {
  static Future getSingleFood(String _id) async {
    try {
      final food =
          await foodDio.get("http://localhost:3000/api/v1/food/${_id}");
      Food _food = Food.fromJson(food.data['data']);
      return _food;
    } on DioError catch (e) {
      Fluttertoast.showToast(msg: e.message as String);
    }
  }

  static Future getFoods() async {
    try {
      final response = await foodDio.get("http://localhost:3000/api/v1/food");

      List<Food> _res = (FoodFromJson(jsonEncode(response.data['data'])));

      return _res;
    } catch (e) {
      print(e);
    }
  }
}
