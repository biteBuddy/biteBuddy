import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:frontend/Restuarant/model/restaurant.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/main.dart';
import 'RestaurantInfo.dart';

class RestaurantCard extends ConsumerStatefulWidget {
  bool favorites;
  RestaurantCard(
      {super.key, required this.restaurantInfo, this.favorites = false});

  Restaurant restaurantInfo;

  @override
  ConsumerState<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends ConsumerState<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RestaurantDetails()));
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0.1,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 33,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA='),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        'Hyatt Place',
                        style: CustomTheme().cardTitle,
                      )
                    ],
                  ),
                )
              ],
            ),
            widget.favorites
                ? Text("")
                : Positioned(
                    right: 15,
                    top: 10,
                    child: CircleAvatar(
                      backgroundColor: CustomTheme().primaryColor1,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 26,
                        ),
                        onPressed: () {
                          ref
                              .watch(FavRestroProvider.notifier)
                              .addFavRestro(widget.restaurantInfo);
                        },
                      ),
                    ),
                  ),
            Positioned(
              left: 4,
              top: 4,
              child: Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
          ]),
        ),
      ),
    );
  }
}
