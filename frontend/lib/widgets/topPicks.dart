import 'package:flutter/material.dart';
import 'package:frontend/Restuarant/Page/RestaurantCard.dart';
import 'package:frontend/Restuarant/model/restaurant.dart';
import 'package:frontend/common/theme.dart';

// ignore_for_file: prefer_const_constructors
class TopPicks extends StatefulWidget {
  const TopPicks({super.key});

  @override
  State<TopPicks> createState() => _TopPicksState();
}

class _TopPicksState extends State<TopPicks> {
  @override
  Widget build(BuildContext context) {
    Restaurant res = Restaurant(
        img: "1.jpeg",
        name: "Hyatt Place ",
        id: "",
        description:
            "Spice up your life with the flavors of the Himalayas! At Himalayan Spice, we use traditional Nepali spices to create dishes that are as bold as they are delicious. From our spicy chicken curry to our flavorful vegetable momos, we have something for everyone. Come and enjoy the taste of the Himalayas! ",
        category: "Cafe");
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top Picks", style: CustomTheme().listTitle),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: RestaurantCard(
              restaurantInfo: res,
            ),
          )
        ],
      ),
    );
  }
}
