// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget4 extends StatefulWidget {
  const MyWidget4({super.key});

  @override
  State<MyWidget4> createState() => _MyWidget4State();
}

class _MyWidget4State extends State<MyWidget4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 7,
        ),
        child: Column(
          children: [
            const Center(
              child: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            const CircleAvatar(
              radius: 80,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "First , Last Name",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
