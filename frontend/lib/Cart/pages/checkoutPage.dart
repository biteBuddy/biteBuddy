import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    List<List<Widget>> widgets = [
      [
        Icon(
          Icons.credit_card_rounded,
          size: 36,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Card",
          style: TextStyle(
              fontFamily: "Poppins", fontSize: 18, fontWeight: FontWeight.w500),
        )
      ],
      [
        Text(
          "E-sewa",
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: Color.fromARGB(155, 92, 179, 69)),
        )
      ]
    ];
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    size: 32,
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Checkout",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(6),
              child: Column(
                children: [Card()],
              ),
            )
          ],
        ),
      )),
    );
  }
}
