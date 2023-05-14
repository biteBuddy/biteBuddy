import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/main.dart';
import 'package:frontend/widgets/nutrientsValue.dart';

class FoodInfo extends ConsumerWidget {
  const FoodInfo({super.key, required this.food});
  final Food food;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cart = ref.watch(CartProvider);
    var addFood = ref.watch(FavRestroProvider).addFaveFood;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
                              image: AssetImage("assets/${food.img}"))),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: () async {
                          addFood(food);
                        },
                        child: CircleAvatar(
                          backgroundColor: CustomTheme().primaryColor1,
                          foregroundColor: Colors.white,
                          child: const Icon(Icons.favorite),
                        ),
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
                const SizedBox(
                  height: 12,
                ),
                Text(
                  food.name,
                  style: CustomTheme().pageTitle,
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
                          "${food.nutrient.price}",
                          style: CustomTheme().priceInfo2,
                        ),
                      ],
                    ),
                    cart.itemExistInList(food.id) != -1
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                splashRadius: 1,
                                onPressed: () async {
                                  await cart.decreaseItem(food.id, food);
                                },
                                icon: Icon(
                                  Icons.remove_circle_outline,
                                  color: CustomTheme().primaryColor1,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "${cart.getCount(food.id)}",
                                style: TextStyle(
                                    color: CustomTheme().primaryColor2,
                                    fontSize: 20),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              IconButton(
                                splashRadius: 1,
                                onPressed: (() async {
                                  await cart.increaseItem(food.id, food);
                                }),
                                icon: Icon(
                                  Icons.add_circle,
                                  color: CustomTheme().primaryColor1,
                                  size: 32,
                                ),
                              )
                            ],
                          )
                        : const Text("")
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  food.description,
                  textAlign: TextAlign.justify,
                  style: CustomTheme().pageDesc,
                ),
                const SizedBox(
                  height: 10,
                ),
                NutientsValue(
                  nutriValue: food.nutrient,
                ),
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  await cart.addToCart(food.id, food);
                },
                child: Container(
                  padding: const EdgeInsets.all(13),
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      color: CustomTheme().primaryColor1,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        foregroundColor: CustomTheme().primaryColor1,
                        radius: 15,
                        child: const Icon(
                          Icons.shopping_bag_rounded,
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        "Add to Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
