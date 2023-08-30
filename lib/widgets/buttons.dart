// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:converter/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    Key? key,
    required this.icon,
    required this.txt,
    required this.function,
  }) : super(key: key);
  final Icon icon;
  final String txt;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => function(),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          width: Get.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colorss.themeNeon1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(height: 10),
              Text(txt, style: Styles.bigTitleStyle.copyWith(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
