import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/ApiSerives/cart.dart';
import 'package:frontend/Cart/model/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Food/model/Food.dart';

class Cart extends ChangeNotifier {
  // list of cart items
  List<CartItem> cartItems = [];
  SharedPreferences? sharedPreferences;
  void initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    notifyListeners();
  }

  Future getCart(List<CartItem> _cartItems) async {
    cartItems = _cartItems;
  }

  Future addToCart(String foodId, Food food) async {
    // Need to check if the item already exists in the card
    //Logic to check if the anyItem in the list has the foodId
    var foodIndex = cartItems.indexWhere((element) => element.foodId == foodId);
    if (foodIndex == -1) {
      final itemId = await CartAPI.addToCart(foodId, 1);
      cartItems
          .add(CartItem(food: food, count: 1, foodId: foodId, itemId: itemId));
    } else {
      increaseItem(foodId, food);
    }
    //notifyListeners for Changes
    notifyListeners();
  }

  Future increaseItem(
    String foodId,
    Food food,
  ) async {
    var foodIndex = cartItems.indexWhere((element) => element.foodId == foodId);

    cartItems[foodIndex].count += 1;
    await CartAPI.updateCart(
        cartItems[foodIndex].itemId, cartItems[foodIndex].count);

    //notifyListeners for Changes
    notifyListeners();
  }

  Future decreaseItem(String foodId, Food food) async {
    var foodIndex = cartItems.indexWhere((element) => element.foodId == foodId);
    if (foodIndex != -1) {
      if (cartItems[foodIndex].count == 1) {
        removeItem(foodId, food);
      } else {
        cartItems[foodIndex].count -= 1;
        await CartAPI.updateCart(
            cartItems[foodIndex].itemId, cartItems[foodIndex].count);
      }
    }
    notifyListeners();
  }

  Future removeItem(String foodId, Food food) async {
    var foodIndex = cartItems.indexWhere((element) => element.foodId == foodId);

    await CartAPI.removeFromCart(cartItems[foodIndex].itemId);
    cartItems.removeAt(foodIndex);
    print(cartItems);
    notifyListeners();
  }

  int itemExistInList(String foodId) {
    var foodIndex = cartItems.indexWhere((element) => element.foodId == foodId);
    return foodIndex;
  }

  int getCount(String foodId) {
    var foodIndex = cartItems.indexWhere((element) => element.foodId == foodId);
    return cartItems[foodIndex].count;
  }
  // Future loadDataFromLocalStorage() {
  //   String value = sharedPreferences!.getString("hey") ?? "";
  //   print(value);
  // }

  // Future loadDataToLocalStorage(Food food) async {
  //   print(jsonEncode(food.toMap()).runtimeType);
  // }

  // Future removeDataFromLocalStorage() {
  //   sharedPreferences!.remove("hey");
  // }
}
