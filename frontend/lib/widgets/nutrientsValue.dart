import 'package:flutter/material.dart';
import 'package:frontend/Food/model/Food.dart';
import 'package:frontend/common/theme.dart';

class NutientsValue extends StatefulWidget {
  NutientsValue({super.key, required this.nutriValue});
  Nutrients nutriValue;
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
          height: 8,
        ),
        Nutri(title: "Mass", value: 200),
        SizedBox(
          height: 8,
        ),
        Nutri(title: "Calories", value: 100),
        SizedBox(
          height: 8,
        ),
        Nutri(title: "Protein", value: 10),
        SizedBox(
          height: 8,
        ),
        Nutri(title: "Fat", value: 5),
        SizedBox(
          height: 8,
        ),
        Nutri(title: "Carbohydrates", value: 4)
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
              width: 8,
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
          "${value} g.",
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
