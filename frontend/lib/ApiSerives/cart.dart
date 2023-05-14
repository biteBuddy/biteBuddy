import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/ApiSerives/food.dart';
import 'package:frontend/ApiSerives/restaurant.dart';
import 'package:frontend/ApiSerives/token.dart';
import 'package:frontend/Cart/model/cart.dart';

Dio cartDio = Dio();

class CartAPI {
  Future<void> initPaymentSheet() async {
    try {
      // 1. create payment intent on the server
      String token = await Token().getToken();
      final data = await cartDio.post('http://localhost:3000/api/v1/payment',
          options: Options(headers: {"authorization": "Bearer ${token}"}));
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Enable custom flow
          customFlow: true,
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          paymentIntentClientSecret: data.data['paymentIntent'],
        ),
      );
    } on StripeConfigException catch (e) {
      print((e));
    } on DioError catch (e) {
      print(e.message);
    }
  }

  static Future getCart() async {
    try {
      String token = await Token().getToken();
      final data = await cartDio.get("http://localhost:3000/api/v1/cart",
          options: Options(headers: {"authorization": "Bearer ${token}"}));

      return cartFromJson(jsonEncode(data.data['data']));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
      rethrow;
    }
  }

  static Future<List<CartItem>> getCartItems() async {
    try {
      final Cart _cart = await getCart();

      List<CartItem> _items = [];
      for (var element in _cart.items) {
        final _food = await FoodAPI.getSingleFood(element.foodId);
        _items.add(CartItem(
            food: _food,
            count: element.quantity,
            foodId: element.foodId,
            itemId: element.id));
      }
      print(_items);
      return _items;
    } on DioError catch (e) {
      throw e;
    }
  }

  static Future updateCart(String itemId, int quantity) async {
    try {
      String token = await Token().getToken();
      final res = await cartDio.post("http://localhost:3000/api/v1/cart",
          options: Options(headers: {"authorization": "Bearer ${token}"}),
          data: {"itemId": itemId, "quantity": quantity});
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }

  static Future addToCart(String foodId, int quantity) async {
    try {
      String token = await Token().getToken();
      final res = await cartDio.post('http://localhost:3000/api/v1/cart',
          options: Options(headers: {"authorization": "Bearer ${token}"}),
          data: {"foodId": foodId, "quantity": quantity});
      return res.data['item']['_id'];
    } on DioError catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: e.message.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }

  static Future removeFromCart(String itemId) async {
    try {
      String token = await Token().getToken();
      final res = await cartDio.post('http://localhost:3000/api/v1/cart/delete',
          options: Options(headers: {"authorization": "Bearer ${token}"}),
          data: {"itemId": itemId});
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }
}
