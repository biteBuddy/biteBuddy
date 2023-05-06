import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Food/model/Food.dart';

class Cart extends ChangeNotifier {
  // list of cart items
  Map<Food, int> cartItem = {};
  SharedPreferences? sharedPreferences;
  void initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    notifyListeners();
  }

  void addToCart(Food food) {
    // Need to check if the item already exists in the card
    if (cartItem.containsKey(food)) {
      cartItem[food] = cartItem[food]! + 1;
    } else {
      cartItem[food] = 1;
    }
    //notifyListeners for Changes
    notifyListeners();
  }

  void increaseItem(Food food) {
    if (cartItem.containsKey(food)) {
      cartItem[food] = cartItem[food]! + 1;
    } else {
      cartItem[food] = 1;
    }
    //notifyListeners for Changes
    notifyListeners();
  }

  void decreaseItem(Food food) {
    if (cartItem.containsKey(food)) {
      if (cartItem[food] == 1) {
        cartItem.remove(food);
      } else {
        cartItem[food] = cartItem[food]! - 1;
      }
    } else {
      print("Cannot decrease an Item that Doesnot exist");
    }
    notifyListeners();
  }

  void removeItem(Food food) {
    cartItem.remove(food);
    notifyListeners();
  }

  void loadDataFromLocalStorage() {
    String value = sharedPreferences!.getString("hey") ?? "";
    print(value);
  }

  void loadDataToLocalStorage(Food food) async {
    print(jsonEncode(food.toMap()).runtimeType);
  }

  void removeDataFromLocalStorage() {
    sharedPreferences!.remove("hey");
  }
}
