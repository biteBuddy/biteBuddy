import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/Restuarant/model/restaurant.dart';

import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';

class FavProvider extends ChangeNotifier {
  List<Restaurant> favRestros = [];
  List<Food> favFood = [];
  void addFavRestro(Restaurant res) {
    favRestros.add(res);
    notifyListeners();
  }

  void addFaveFood(Food food) {
    favFood.add(food);
    notifyListeners();
  }
}
