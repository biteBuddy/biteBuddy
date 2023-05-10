import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/Restuarant/model/restaurant.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/Food/Page/singleCard.dart';

class RestaurantDetails extends StatefulWidget {
  RestaurantDetails({super.key, required this.resInfo});
  Restaurant resInfo;
  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
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

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
                            image: AssetImage("assets/${widget.resInfo.img}"))),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: CircleAvatar(
                      backgroundColor: CustomTheme().primaryColor1,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.favorite),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: (() => Navigator.pop(context)),
                      child: CircleAvatar(
                        backgroundColor: CustomTheme().primaryColor1,
                        foregroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 30,
                        ),
                      ),
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
                  Text(widget.resInfo.name, style: CustomTheme().pageTitle),
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: CustomTheme().categoryColor["fine_dining"],
                ),
                child: Text(
                  widget.resInfo.category,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.resInfo.description,
                textAlign: TextAlign.justify,
                style: CustomTheme().pageDesc,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Trending this week", style: CustomTheme().listTitle),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SingleFood(
                      food: food,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SingleFood(
                      food: food,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SingleFood(
                      food: food,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Menu", style: CustomTheme().listTitle),
                  GestureDetector(
                    child: Text(
                      "View All >",
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
                    SingleFood(
                      food: food,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SingleFood(
                      food: food,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SingleFood(
                      food: food,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SingleFood(
                      food: food,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SingleFood(
                      food: food,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
