// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'package:frontend/Food/model/Food.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  String id;
  String createdBy;
  List<Item> items;

  Cart({
    required this.id,
    required this.createdBy,
    required this.items,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        createdBy: json["createdBy"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "createdBy": createdBy,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String foodId;
  int quantity;
  String id;
  int v;

  Item({
    required this.foodId,
    required this.quantity,
    required this.id,
    required this.v,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        foodId: json["foodId"],
        quantity: json["quantity"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "foodId": foodId,
        "quantity": quantity,
        "_id": id,
        "__v": v,
      };
}

class CartItem {
  String itemId;
  String foodId;
  Food food;
  int count;
  CartItem({required this.food, required this.count, required this.foodId,required this.itemId});
  factory CartItem.fromjson(
          Map<String, dynamic> json, int count, String foodId) =>
      CartItem(food: Food.fromJson(json), count: count, foodId: foodId,itemId:json['itemId']);
}
