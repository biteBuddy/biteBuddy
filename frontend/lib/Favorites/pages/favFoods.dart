import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/Favorites/provider/favProvider.dart';
import 'package:frontend/Food/Page/singleCard.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/main.dart';

class FavFood extends ConsumerWidget {
  const FavFood({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Food> foods = ref.watch(FavRestroProvider).favFood;
    return Column(
      children: [
        ...foods.map(
          (e) => SingleFood(ingredients: ["Cheese", "Macaroni", "Mushroom"]),
        )
      ],
    );
  }
}
