import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/widgets/singleFood.dart';

class FavFoods extends StatefulWidget {
  const FavFoods({super.key});

  @override
  State<FavFoods> createState() => _FavFoodsState();
}

class _FavFoodsState extends State<FavFoods> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      SingleFood(ingredients: ["Cheese", "Macaroni", "Mushroom"]),
      SingleFood(ingredients: ["Cheese", "Macaroni", "Mushroom"]),
      SingleFood(ingredients: ["Cheese", "Macaroni", "Mushroom"]),
      SingleFood(ingredients: ["Cheese", "Macaroni", "Mushroom"]),
      SingleFood(ingredients: ["Cheese", "Macaroni", "Mushroom"]),
      SingleFood(ingredients: ["Cheese", "Macaroni", "Mushroom"]),
      SingleFood(ingredients: ["Cheese", "Macaroni", "Mushroom"]),
      SingleFood(ingredients: ["Cheese", "Macaroni", "Mushroom"]),
      SingleFood(ingredients: ["Cheese", "Macaroni", "Mushroom"]),
      SingleFood(ingredients: ["Cheese", "Macaroni", "Mushroom"]),
    ]);
  }
}
