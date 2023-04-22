// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/Favorites/provider/favProvider.dart';
import 'package:frontend/Restuarant/Page/RestaurantCard.dart';
import 'package:frontend/Restuarant/model/restaurant.dart';
import 'package:frontend/main.dart';

class FavRestro extends ConsumerStatefulWidget {
  const FavRestro({super.key});

  @override
  ConsumerState<FavRestro> createState() => _FavRestroState();
}

class _FavRestroState extends ConsumerState<FavRestro> {
  @override
  Widget build(BuildContext context) {
    List<Restaurant> favRestros =
        ref.watch(FavRestroProvider.notifier).favRestros;

    // ref.listen(FavRestroProvider, ((previous, next) {
    //   print("This is next ${next}");
    // }));
    // print(favRestros);
    return Column(children: [
      ...favRestros.map((e) => RestaurantCard(
            restaurantInfo: e,
            favorites: true,
          ))
    ]);
  }
}
