import 'dart:ui';

import 'package:converter/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BubbleWrapper extends StatelessWidget {
  const BubbleWrapper({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colorss.forebackground,
      child: Stack(
        children: [
          Center(
              child: Lottie.asset("assets/json/bubble.json", height: Get.height, width: Get.width, fit: BoxFit.cover)),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
