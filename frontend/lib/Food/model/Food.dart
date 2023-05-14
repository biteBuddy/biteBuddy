// To parse this JSON data, do
//
//     final Food = FoodFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Food> FoodFromJson(String str) =>
    List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));

class Food {
  String id;
  String name;
  String description;
  String img;
  String restaurantId;
  Nutrient nutrient;

  Food({
    required this.id,
    required this.name,
    required this.description,
    required this.img,
    required this.restaurantId,
    required this.nutrient,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        img: json["img"] ?? "",
        restaurantId: json["restaurantd"] ?? "",
        nutrient: Nutrient.fromJson(json["nutrient"] ?? ""),
      );
}

class Nutrient {
  double massInG;
  double calories;
  double protein;
  double carbs;
  double fat;
  double price;

  Nutrient({
    required this.massInG,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.price,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
        massInG: Calories.doublefromJson(json["mass_in_g"]) as double,
        calories: Calories.doublefromJson(json["calories"]) as double,
        protein: Calories.doublefromJson(json["protein"]) as double,
        carbs: Calories.doublefromJson(json["carbs"]) as double,
        fat: Calories.doublefromJson(json["fat"]) as double,
        price: Calories.doublefromJson(json["price"]) as double,
      );
}

class Calories {
  double numberDecimal;

  Calories({
    required this.numberDecimal,
  });

  static doublefromJson(Map<String, dynamic> json) =>
      double.parse(json["\$numberDecimal"]);

  Map<String, dynamic> toJson() => {
        "\$numberDecimal": numberDecimal,
      };
}
