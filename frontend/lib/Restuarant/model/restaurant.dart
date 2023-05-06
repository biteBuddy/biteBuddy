// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Restaurant> restaurantFromJson(String str) =>
    List<Restaurant>.from(json.decode(str).map((x) => Restaurant.fromJson(x)));

String restaurantToJson(List<Restaurant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Restaurant {
  String id;
  String name;
  String description;
  String img;
  String category;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.img,
    required this.category,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    print(json);
    return Restaurant(
      id: json["_id"],
      name: json["name"],
      description: json["description"],
      img: json["img"],
      category: json["category"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "img": img,
        "category": category,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
