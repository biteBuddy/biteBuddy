import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/Restuarant/Page/RestaurantCard.dart';
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
        img:
            "https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=",
        name: "Hyatt Place ",
        id: "asdf",
        description: "a");
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Restaurants",
            style: CustomTheme().listTitle,
          ),
          GestureDetector(
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
