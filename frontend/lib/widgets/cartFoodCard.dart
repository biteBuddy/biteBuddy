import 'package:flutter/material.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/common/theme.dart';

class CartCard extends StatefulWidget {
  CartCard({super.key, required this.food});
  Food food;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    List<String> ingredients = ["Chicken", "Cheese"];
    return Container(
      height: MediaQuery.of(context).size.height / 8.5,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 3.9,
            height: MediaQuery.of(context).size.height / 8.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(widget.food.img), fit: BoxFit.cover)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.food.name,
                style: CustomTheme().cardTitle,
              ),
              Text(
                "Chicken,Cheese,Flour",
                style: CustomTheme().cardDesc,
              ),
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
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.close_outlined),
                color: CustomTheme().primaryColor1,
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
                    shadows: [
                      BoxShadow(
                          color: CustomTheme().primaryColor1,
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 1))
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
