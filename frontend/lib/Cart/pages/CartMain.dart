// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/widgets/cartFoodCard.dart';
import 'package:frontend/widgets/line.dart';

class CartMain extends StatefulWidget {
  const CartMain({super.key});

  @override
  State<CartMain> createState() => _CartMainState();
}

class _CartMainState extends State<CartMain> {
  @override
  Widget build(BuildContext context) {
    Nutrients nutri =
        Nutrients(calories: 200, mass_in_g: 50, protien: 8, carbs: 5, fat: 1);
    Food food = Food(
        name: "Chicken Burger",
        img: "https://burgerburger.co.nz/wp-content/uploads/2020/01/BC.jpg",
        desc:
            "Minced Meat seared and kept between burgers with cheese tomato mayo and much more all suited for your taste buds.",
        price: 250,
        nutrients: nutri);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Cart",
                style: TextStyle(fontFamily: "Poppins", fontSize: 18),
              ),
              //contianer for food items in cart
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.8,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      CartCard(
                        food: food,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CartCard(
                        food: food,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CartCard(
                        food: food,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CartCard(
                        food: food,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      hintText: "Apply a promo code",
                      labelStyle: const TextStyle(fontFamily: "Poppins"),
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Subtotal", style: CustomTheme().totalStyle),
                        Text(
                          "Rs.${300}",
                          style: CustomTheme().totalPrice,
                        )
                      ],
                    ),
                    Line(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tax", style: CustomTheme().totalStyle),
                        Text(
                          "Rs.${20}",
                          style: CustomTheme().totalPrice,
                        )
                      ],
                    ),
                    Line(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery", style: CustomTheme().totalStyle),
                        Text(
                          "Rs.${50}",
                          style: CustomTheme().totalPrice,
                        )
                      ],
                    ),
                    Line(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total", style: CustomTheme().totalStyle),
                        Text(
                          "Rs.${300}",
                          style: CustomTheme().totalPrice,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                    color: CustomTheme().primaryColor1,
                    borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
