import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/main.dart';

class CartCard extends ConsumerWidget {
  CartCard({super.key, required this.food, required this.count});
  Food food;
  int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(CartProvider);
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
                    image: NetworkImage(food.img), fit: BoxFit.cover)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                food.name,
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
                    "${food.price}",
                    style: CustomTheme().priceInfo2,
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  cart.removeItem(food);
                },
                icon: Icon(Icons.close_outlined),
                color: CustomTheme().primaryColor1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (() {
                      cart.loadDataFromLocalStorage();
                      cart.decreaseItem(food);
                    }),
                    child: Icon(
                      Icons.remove_circle_outline,
                      color: CustomTheme().primaryColor1,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "${count}",
                    style: TextStyle(
                        color: CustomTheme().primaryColor2, fontSize: 18),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () async {
                      cart.loadDataToLocalStorage(food);
                      cart.increaseItem(food);
                    },
                    child: Icon(
                      Icons.add_circle,
                      color: CustomTheme().primaryColor1,
                      size: 24,
                    ),
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
