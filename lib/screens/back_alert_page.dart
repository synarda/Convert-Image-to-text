// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:converter/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackAlert extends StatelessWidget {
  const BackAlert({
    Key? key,
    required this.txt,
  }) : super(key: key);

  final String txt;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colorss.backgroundColor,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), border: Border.all(width: 0.1, color: Colorss.textColor)),
        child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              Text(
                "Are you sure?",
                style: Styles.bigTitleStyle,
              ),
              Text(
                txt,
                style: Styles.smallTextStyle.copyWith(color: Colors.white, fontSize: 11),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: Get.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colorss.themeNeon1),
                        ),
                        child: ElevatedButton(
                          onPressed: () => Get.back(result: "no"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colors.transparent,
                            textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "No",
                              style: Styles.smallTextStyle.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () => Get.back(result: "yes"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Colorss.themeNeon1,
                            textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Yes",
                              style: Styles.smallTextStyle.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
