import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:frontend/Food/Page/allFood.dart';
import 'package:frontend/Food/Page/singleCard.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/common/theme.dart';

class FoodSlider extends StatefulWidget {
  const FoodSlider({super.key});

  @override
  State<FoodSlider> createState() => _FoodSliderState();
}

class _FoodSliderState extends State<FoodSlider> {
  @override
  Widget build(BuildContext context) {
    Nutrient nutri = Nutrient(
        calories: 200, massInG: 50, protein: 8, carbs: 5, fat: 1, price: 350);
    Food food = Food(
        id: "asdfg",
        name: "Chicken Burger",
        img: "burger.jpeg",
        description:
            "Minced Meat seared and kept between burgers with cheese tomato mayo and much more all suited for your taste buds.",
        nutrient: nutri,
        restaurantId: "asdfa");

    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Foods", style: CustomTheme().listTitle),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Foods()));
            },
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
              SingleFood(food: food),
              SizedBox(
                width: 8,
              ),
              SingleFood(food: food),
              SizedBox(
                width: 8,
              ),
              SingleFood(food: food),
              SizedBox(
                width: 8,
              ),
              SingleFood(food: food),
              SizedBox(
                width: 8,
              ),
              SingleFood(food: food),
            ],
          ),
        ),
      ],
    );
  }
}
