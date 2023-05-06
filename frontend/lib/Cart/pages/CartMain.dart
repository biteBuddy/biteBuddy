// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/Cart/pages/checkoutPage.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/main.dart';
import 'package:frontend/widgets/cartFoodCard.dart';
import 'package:frontend/widgets/line.dart';

class CartMain extends ConsumerStatefulWidget {
  const CartMain({super.key});

  @override
  ConsumerState<CartMain> createState() => _CartMainState();
}

class _CartMainState extends ConsumerState<CartMain> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Nutrients nutri =
        Nutrients(calories: 200, mass_in_g: 50, protien: 8, carbs: 5, fat: 1);
    Food food = Food(
      id:"asdf",
        name: "Chicken Burger",
        img: "https://burgerburger.co.nz/wp-content/uploads/2020/01/BC.jpg",
        desc:
            "Minced Meat seared and kept between burgers with cheese tomato mayo and much more all suited for your taste buds.",
        price: 250,
        nutrients: nutri);
    final cart = ref.watch(CartProvider);
    cart.initSharedPreferences();
    final Map<Food, int> _cartItems = cart.cartItem;
    bool exists = !_cartItems.isEmpty;

    Map<String, double> _prices = {
      "subTotal": 0,
      "Tax": 0,
      "Delivery": 50,
      "total": 0
    };

    //get Total Price
    _cartItems.forEach((key, value) {
      _prices["subTotal"] = _prices["subTotal"]! + value * key.price;
    });
    // get Tax
    _prices["Tax"] = _prices["subTotal"]! * 0.01;
    _prices["total"] =
        _prices["subTotal"]! + _prices["Tax"]! + _prices["Delivery"]!;

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
              exists
                  ? Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2.8,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                ..._cartItems.keys.map((e) {
                                  return Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CartCard(
                                        food: e,
                                        count: _cartItems[e] as int,
                                      )
                                    ],
                                  );
                                })
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
                                labelStyle:
                                    const TextStyle(fontFamily: "Poppins"),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Subtotal",
                                      style: CustomTheme().totalStyle),
                                  Text(
                                    "Rs.${_prices["subTotal"]}",
                                    style: CustomTheme().totalPrice,
                                  )
                                ],
                              ),
                              Line(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Tax", style: CustomTheme().totalStyle),
                                  Text(
                                    "Rs.${_prices["Tax"]}",
                                    style: CustomTheme().totalPrice,
                                  )
                                ],
                              ),
                              Line(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Delivery",
                                      style: CustomTheme().totalStyle),
                                  Text(
                                    "Rs.${_prices["Delivery"]}",
                                    style: CustomTheme().totalPrice,
                                  )
                                ],
                              ),
                              Line(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total",
                                      style: CustomTheme().totalStyle),
                                  Text(
                                    "Rs.${_prices["total"]}",
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
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => Checkout())));
                              },
                              child: Text(
                                "Checkout",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w300),
                              )),
                        ),
                      ],
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(image: AssetImage("Group.png")),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Cart is Empty",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                                fontFamily: "Poppins"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Start adding food you love",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.black54,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
