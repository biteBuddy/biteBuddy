import 'package:flutter/material.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/common/theme.dart';

class NutientsValue extends StatefulWidget {
  NutientsValue({super.key, required this.nutriValue});
  Nutrient nutriValue;
  @override
  State<NutientsValue> createState() => _NutientsValueState();
}

class _NutientsValueState extends State<NutientsValue> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Nutrition Values",
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 20, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 12,
        ),
        Nutri(title: "Mass", value: widget.nutriValue.massInG),
        SizedBox(
          height: 12,
        ),
        Nutri(title: "Calories", value: widget.nutriValue.calories),
        SizedBox(
          height: 12,
        ),
        Nutri(title: "Protein", value: widget.nutriValue.protein),
        SizedBox(
          height: 12,
        ),
        Nutri(title: "Fat", value: widget.nutriValue.fat),
        SizedBox(
          height: 12,
        ),
        Nutri(title: "Carbohydrates", value: widget.nutriValue.carbs)
      ],
    );
  }
}

class Nutri extends StatelessWidget {
  Nutri({super.key, required this.title, required this.value});
  String title;
  double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              CustomTheme().nutri_Image[title] as String,
              height: 28,
            ),
            SizedBox(
              width: 12,
            ),
            Text(title,
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1)),
          ],
        ),
        Text(
          "${value} ${title == "Calories" ? "" : "g"}",
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 1),
        )
      ],
    );
  }
}
