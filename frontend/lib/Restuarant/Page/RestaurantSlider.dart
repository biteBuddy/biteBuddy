import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/Restuarant/Page/RestaurantCard.dart';
import 'package:frontend/Restuarant/Page/allRestaurants.dart';
import 'package:frontend/Restuarant/model/restaurant.dart';
import 'package:frontend/common/theme.dart';

class ResSlider extends StatefulWidget {
  const ResSlider({super.key});

  @override
  State<ResSlider> createState() => _ResSliderState();
}

class _ResSliderState extends State<ResSlider> {
  @override
  Widget build(BuildContext context) {
    Restaurant res = Restaurant(
        img: "7.jpeg",
        name: "Hyatt Place ",
        id: "",
        description:
            "Spice up your life with the flavors of the Himalayas! At Himalayan Spice, we use traditional Nepali spices to create dishes that are as bold as they are delicious. From our spicy chicken curry to our flavorful vegetable momos, we have something for everyone. Come and enjoy the taste of the Himalayas! ",
        category: "Cafe");
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Restaurants",
            style: CustomTheme().listTitle,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Restaurants()));
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
              RestaurantCard(
                restaurantInfo: res,
              ),
              SizedBox(
                width: 8,
              ),
              RestaurantCard(
                restaurantInfo: res,
              ),
              SizedBox(
                width: 8,
              ),
              RestaurantCard(
                restaurantInfo: res,
              ),
              SizedBox(
                width: 8,
              ),
              RestaurantCard(
                restaurantInfo: res,
              ),
              SizedBox(
                width: 8,
              ),
              RestaurantCard(
                restaurantInfo: res,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
