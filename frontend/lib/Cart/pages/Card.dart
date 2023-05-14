import 'package:flutter/material.dart';

class Card extends StatelessWidget {
  const Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Select your Card",
                style: TextStyle(),
              )
            ],
          )
        ],
      ),
    );
  }
}
