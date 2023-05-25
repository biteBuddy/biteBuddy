import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/common/theme.dart';
import 'package:frontend/widgets/Category.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: CustomTheme().listTitle,
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Category(name: "Fast Food"),
              Category(name: "Fine Dining"),
              Category(name: "Cafe"),
              Category(name: "Buffet"),
              Category(name: "Bistro"),
            ],
          ),
        )
      ],
    );
  }
}
