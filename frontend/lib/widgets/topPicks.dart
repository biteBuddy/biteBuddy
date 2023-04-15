import 'package:flutter/material.dart';
import 'package:frontend/Restuarant/Page/RestaurantCard.dart';

// ignore_for_file: prefer_const_constructors
class TopPicks extends StatefulWidget {
  const TopPicks({super.key});

  @override
  State<TopPicks> createState() => _TopPicksState();
}

class _TopPicksState extends State<TopPicks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Picks",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: RestaurantCard(),
          )
        ],
      ),
    );
  }
}