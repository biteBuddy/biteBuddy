import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/common/theme.dart';
import 'RestaurantInfo.dart';

class RestaurantCard extends StatefulWidget {
  const RestaurantCard({super.key});

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RestaurantDetails()));
      }),
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 239, 239),
            borderRadius: BorderRadius.circular(20)),
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
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      'Hyatt Place',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            right: 15,
            top: 10,
            child: CircleAvatar(
              backgroundColor: CustomTheme().primaryColor1,
              child: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 26,
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
    );
  }
}
