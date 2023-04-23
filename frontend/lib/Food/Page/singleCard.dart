import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/Food/Page/FoodInfo.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/common/theme.dart';

class SingleFood extends StatefulWidget {
  SingleFood({super.key, required List<String> this.ingredients});
  List<String> ingredients;
  @override
  State<SingleFood> createState() => _SingleFoodState();
}

class _SingleFoodState extends State<SingleFood> {
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
    return GestureDetector(
      onDoubleTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => FoodInfo(
                      food: food,
                    ))));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0.1,
        child: Container(
          width: MediaQuery.of(context).size.width - 33,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 180,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://burgerburger.co.nz/wp-content/uploads/2020/01/BC.jpg"),
                                fit: BoxFit.fitWidth)),
                      ),
                      Positioned(
                        left: 4,
                        bottom: -20,
                        child: Card(
                          elevation: 0.1,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  "4.5",
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 255, 197, 41),
                                  size: 21,
                                )
                              ],
                            ),
                          ),
                        ),
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
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Food Name",
                              style: CustomTheme().cardTitle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Row(
                        //   children: [
                        //     ...widget.ingredients.map((e) => Container(
                        //           margin: EdgeInsets.symmetric(horizontal: 3),
                        //           child: Text(
                        //             e,
                        //             style: TextStyle(
                        //                 fontSize: 17, color: Colors.grey),
                        //           ),
                        //         ))
                        //   ],
                        // )
                        Text(
                            "Short description preferably under 100 characters")
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              )
            ],
          ),
        ),
      ),
    );
  }
}
