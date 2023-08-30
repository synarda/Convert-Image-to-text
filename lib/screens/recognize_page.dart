import 'package:converter/controllers/recognize_controller.dart';
import 'package:converter/utils/const.dart';
import 'package:converter/widgets/bubble_wrapper.dart';
import 'package:converter/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RecognizePage extends StatelessWidget {
  const RecognizePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RecognizeController());
    return BubbleWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset("assets/json/detective.json", height: 300, width: 300, fit: BoxFit.cover),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text("I don't recognize you. Can you please tell me your name?",
                style: Styles.smallTextStyle.copyWith(color: Colors.white.withOpacity(0.4))),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: TextfieldWidget(
              fontsize: 13,
              limit: 20,
              obscure: false,
              controller: controller.nameController,
              borderColor: Colorss.backgroundColor,
              hintText: "Name",
              labelColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 80,
            width: Get.width,
            child: GestureDetector(
              onTap: () => controller.saveName(),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colorss.themeNeon1),
                child: Text("Continue", style: Styles.smallTextStyle.copyWith(color: Colors.white)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
