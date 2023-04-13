// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/widgets/singleFood.dart';

class RestaurantDetails extends StatefulWidget {
  const RestaurantDetails({super.key});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA="))),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: CircleAvatar(
                    backgroundColor: CustomTheme().primaryColor1,
                    foregroundColor: Colors.white,
                    child: Icon(Icons.favorite),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hyatt Place",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 21, 30, 63)),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: CustomTheme().primaryColor1,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Location,Location",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Some sort of information about the restaurant that reflects its identity.This section will be able to pull in customer.And keep them on this page of the app. Be sure to provide a stunning description for the restaurant.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Menu",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: CustomTheme().primaryColor2),
                ),
                GestureDetector(
                  child: Text(
                    "View All",
                    style: TextStyle(color: CustomTheme().primaryColor1),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
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
            )
          ],
        ),
      )),
    );
  }
}
