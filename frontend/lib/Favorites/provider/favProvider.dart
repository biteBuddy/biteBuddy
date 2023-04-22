import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/Restuarant/model/restaurant.dart';

import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';

class FavProvider extends ChangeNotifier {
  List<Restaurant> favRestros = [];

  void addFavRestro(Restaurant res) {
    favRestros.add(res);
    notifyListeners();
  }
}
