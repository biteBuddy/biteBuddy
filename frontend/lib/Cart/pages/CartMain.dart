// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/ApiSerives/cart.dart';
import 'package:frontend/Cart/model/cart.dart';
import 'package:frontend/Cart/pages/checkoutPage.dart';

import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/common/discountCodes.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/main.dart';

import 'package:frontend/widgets/cartFoodCard.dart';
import 'package:frontend/widgets/line.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
    Nutrient nutri = Nutrient(
        calories: 200, massInG: 50, protein: 8, carbs: 5, fat: 1, price: 350);
    Food food = Food(
        id: "asdfg",
        name: "Chicken Burger",
        img: "https://burgerburger.co.nz/wp-content/uploads/2020/01/BC.jpg",
        description:
            "Minced Meat seared and kept between burgers with cheese tomato mayo and much more all suited for your taste buds.",
        nutrient: nutri,
        restaurantId: "asdfa");
    var cart = ref.watch(CartProvider);
    // cart.initSharedPreferences();
    // final Map<Food, int> _cartItems = cart.cartItem;
    // bool exists = !_cartItems.isEmpty;
    Map<String, dynamic> _prices = {};
    Map<String, dynamic> getPrices(List<CartItem> _cartItems) {
      Map<String, double> _prices = {
        "subTotal": 0,
        "Tax": 0,
        "Delivery": 50,
        "total": 0
      };

      //get Total Price
      _cartItems.forEach((value) {
        _prices["subTotal"] =
            _prices["subTotal"]! + value.count * value.food.nutrient.price;
      });
      // get Tax
      _prices["Tax"] = _prices["subTotal"]! * 0.01;
      _prices["total"] =
          _prices["subTotal"]! + _prices["Tax"]! + _prices["Delivery"]!;
      return _prices;
    }

    Map<String, dynamic> applyDiscountCode(
        String code, Map<String, dynamic> _prices) {
      _prices["subTotal"] = _prices['subTotal'] * discount_codes[code] * 0.01;
      _prices["Tax"] = _prices["subTotal"]! * 0.01;
      _prices["total"] =
          _prices["subTotal"]! + _prices["Tax"]! + _prices["Delivery"]!;
      return _prices;
    }

    double roundOffToXDecimal(double number, {int numberOfDecimal = 2}) {
      // To prevent number that ends with 5 not round up correctly in Dart (eg: 2.275 round off to 2.27 instead of 2.28)
      String numbersAfterDecimal = number.toString().split('.')[1];
      if (numbersAfterDecimal != '0') {
        int existingNumberOfDecimal = numbersAfterDecimal.length;
        double incrementValue = 1 / (10 * pow(10, existingNumberOfDecimal));
        if (number < 0) {
          number -= incrementValue;
        } else {
          number += incrementValue;
        }
      }

      return double.parse(number.toStringAsFixed(numberOfDecimal));
    }

    TextEditingController _promo_code = new TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: FutureBuilder(
              future: CartAPI.getCartItems(),
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  Fluttertoast.showToast(msg: snapshot.error.toString());
                  return Text(snapshot.error.toString());
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.fourRotatingDots(
                        color: CustomTheme().primaryColor1, size: 30),
                  );
                } else {
                  List<CartItem> _cartItems = snapshot.data as List<CartItem>;
                  cart.getCart(_cartItems);
                  _prices = getPrices(_cartItems);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Cart",
                        style: CustomTheme().pageTitle,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 8,
                        height: 2.5,
                        color: CustomTheme().primaryColor1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //contianer for food items in cart
                      !_cartItems.isEmpty
                          ? Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2.8,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: [
                                        ..._cartItems.map((e) {
                                          return Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              CartCard(
                                                food: e.food,
                                                count: e.count as int,
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  child: TextField(
                                    controller: _promo_code,
                                    decoration: InputDecoration(
                                        suffixIcon: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                CustomTheme().primaryColor1,
                                            foregroundColor: Colors.white,
                                            child: IconButton(
                                              icon: Icon(Icons.keyboard_return),
                                              onPressed: () {
                                                if (_promo_code.text == "") {
                                                } else {
                                                  setState(() {
                                                    _prices = applyDiscountCode(
                                                        _promo_code.text,
                                                        _prices);
                                                  });
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        filled: true,
                                        hintText: "Apply a promo code",
                                        labelStyle: const TextStyle(
                                            fontFamily: "Poppins"),
                                        fillColor: Colors.grey.shade100,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25))),
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
                                            "Rs.${roundOffToXDecimal(_prices["subTotal"] * 100)}",
                                            style: CustomTheme().totalPrice,
                                          )
                                        ],
                                      ),
                                      Line(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Tax",
                                              style: CustomTheme().totalStyle),
                                          Text(
                                            "Rs.${roundOffToXDecimal(_prices["Tax"] * 100)}",
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
                                            "Rs.${roundOffToXDecimal(_prices["Delivery"] * 100)}",
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
                                            "Rs.${roundOffToXDecimal(_prices["total"] * 100)}",
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
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  decoration: BoxDecoration(
                                      color: CustomTheme().primaryColor1,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: TextButton(
                                      onPressed: () async {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    CreditCardPage(
                                                      total: _prices['total'],
                                                    ))));
                                        // try {
                                        //   await Stripe.instance
                                        //       .presentPaymentSheet();
                                        //   print("Payment Successfull");
                                        // } on StripeException catch (e) {
                                        //   Fluttertoast.showToast(
                                        //       msg: e.toString());
                                        // } catch (e) {
                                        //   Fluttertoast.showToast(
                                        //       msg: e.toString());
                                        // }
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
                  );
                }
              }),
            )),
      ),
    );
  }
}
