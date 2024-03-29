import 'package:auto_size_text/auto_size_text.dart';
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RestaurantDetails(
                      resInfo: widget.restaurantInfo,
                    )));
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0.1,
        child: Container(
          width: MediaQuery.of(context).size.width - 20 - 5,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 33,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assets/${widget.restaurantInfo.img}"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.restaurantInfo.name,
                        style: CustomTheme().cardTitle,
                      ),
                      AutoSizeText(
                        widget.restaurantInfo.description,
                        style: CustomTheme().cardDesc,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
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
