import 'dart:async';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:frontend/common/theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadinScreen extends StatefulWidget {
  const LoadinScreen({super.key});

  @override
  State<LoadinScreen> createState() => _LoadinScreenState();
}

class _LoadinScreenState extends State<LoadinScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      // child: Stack(
      //   children: [
      //     Image.asset('assets/logo.png'),
      //     Positioned(
      //       bottom: 100,
      //       right: MediaQuery.of(context).size.width / 2 - 40,
      //       child: LoadingAnimationWidget.fourRotatingDots(
      //           color: CustomTheme().primaryColor1, size: 40),
      //     )
      //   ],
      // ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     Stack(
      //       children: [
      //         Image.asset('assets/logo.png'),
      //         Center(
      //           // right: MediaQuery.of(context).size.width / 2 - 78,
      //           // bottom: 40,
      //           child: const Text(
      //             "Explore what you eat.",
      //             style: TextStyle(fontSize: 16, color: Colors.grey),
      //           ),
      //         ),
      //       ],
      //     ),
      //     LoadingAnimationWidget.fourRotatingDots(
      //         color: CustomTheme().primaryColor1, size: 40)
      //   ],
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png'),
          LoadingAnimationWidget.fourRotatingDots(
              color: CustomTheme().primaryColor1, size: 40),
        ],
      ),
    );
  }
}
