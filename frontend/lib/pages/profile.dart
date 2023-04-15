// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
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
