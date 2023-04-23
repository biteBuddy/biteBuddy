import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Food/Page/singleCard.dart';
import 'package:frontend/common/theme.dart';

class FoodSlider extends StatefulWidget {
  const FoodSlider({super.key});

  @override
  State<FoodSlider> createState() => _FoodSliderState();
}

class _FoodSliderState extends State<FoodSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Foods", style: CustomTheme().listTitle),
          GestureDetector(
            child: Text(
              "View All >",
              style: TextStyle(color: CustomTheme().primaryColor1),
            ),
          ),
        ]),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleFood(ingredients: ["Chicken", "Cheese", "Tomato"]),
              SizedBox(
                width: 8,
              ),
              SingleFood(ingredients: ["Chicken", "Cheese", "Tomato"]),
              SizedBox(
                width: 8,
              ),
              SingleFood(ingredients: ["Chicken", "Cheese", "Tomato"]),
              SizedBox(
                width: 8,
              ),
              SingleFood(ingredients: ["Chicken", "Cheese", "Tomato"]),
              SizedBox(
                width: 8,
              ),
              SingleFood(ingredients: ["Chicken", "Cheese", "Tomato"]),
            ],
          ),
        ),
      ],
    );
  }
}
