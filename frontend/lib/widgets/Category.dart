import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/common/theme.dart';

import '../Restuarant/Page/category_page.dart';

class Category extends StatefulWidget {
  Category({super.key, required this.name});
  String name;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => RestroCategory(
                      category: widget.name,
                    ))));
      }),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: (MediaQuery.of(context).size.width - 50) / 2,
            height: (MediaQuery.of(context).size.height / 5.5),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        CustomTheme().category_Image[widget.name] as String))),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width - 50) / 8,
            top: (MediaQuery.of(context).size.width - 50) / 5,
            child: Text(
              widget.name,
              style: const TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.black12,
                  fontWeight: FontWeight.w900,
                  fontSize: 21),
            ),
          )
        ],
      ),
    );
  }
}
