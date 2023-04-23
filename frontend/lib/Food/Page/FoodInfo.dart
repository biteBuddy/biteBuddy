import 'package:flutter/material.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/widgets/nutrientsValue.dart';

class FoodInfo extends StatefulWidget {
  FoodInfo({super.key, required this.food});
  Food food;
  @override
  State<FoodInfo> createState() => _FoodInfoState();
}

class _FoodInfoState extends State<FoodInfo> {
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
                          image: NetworkImage(widget.food.img))),
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
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 0.1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 6),
                        decoration: BoxDecoration(
                            color: CustomTheme().primaryColor1,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              widget.food.name,
              style: CustomTheme().pageTitle,
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "Rs. ",
                      style: CustomTheme().priceInfo1,
                    ),
                    Text(
                      "${widget.food.price}",
                      style: CustomTheme().priceInfo2,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.remove_circle_outline,
                      color: CustomTheme().primaryColor1,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "0",
                      style: TextStyle(
                          color: CustomTheme().primaryColor2, fontSize: 24),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.add_circle,
                      color: CustomTheme().primaryColor1,
                      size: 32,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              widget.food.desc,
              textAlign: TextAlign.justify,
              style: CustomTheme().pageDesc,
            ),
            SizedBox(
              height: 10,
            ),
            NutientsValue(
              nutriValue: widget.food.nutrients,
            )
          ],
        ),
      )),
    );
  }
}
