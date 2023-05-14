import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/ApiSerives/restaurant.dart';
import 'package:frontend/Restuarant/Page/RestaurantCard.dart';
import 'package:frontend/Restuarant/model/restaurant.dart';
import 'package:frontend/common/theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Restaurants extends StatefulWidget {
  const Restaurants({super.key});

  @override
  State<Restaurants> createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: restaurantAPI.getRestaurants(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.fallingDot(
                      color: CustomTheme().primaryColor1, size: 30),
                );
              } else if (snapshot.hasError) {
                return Text("Error Occured: ${snapshot.error}");
              } else {
                List<Restaurant> _allRes = snapshot.data as List<Restaurant>;
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_ios)),
                            Center(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Restaurants",
                                  style: CustomTheme().pageTitle,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 5,
                                  height: 2.5,
                                  color: CustomTheme().primaryColor1,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "\"Explore Between Various Restuarants.\"",
                                  style: CustomTheme()
                                      .cardDesc
                                      .copyWith(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ))
                          ],
                        ),
                        ..._allRes.map((e) => RestaurantCard(restaurantInfo: e))
                      ],
                    ),
                  ),
                );
              }
            })),
      ),
    );
  }
}
