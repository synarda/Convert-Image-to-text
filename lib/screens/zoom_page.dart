// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:converter/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZoomPage extends StatelessWidget {
  const ZoomPage({
    Key? key,
    required this.path,
  }) : super(key: key);
  final String path;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      contentPadding: const EdgeInsets.all(20),
      backgroundColor: Colorss.forebackground,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: Get.height / 1.5,
            width: Get.width,
            child: Image.file(
              File(path),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: Get.back,
            child: Container(
                height: 60,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colorss.themeNeon1,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 32),
                child: Text("Okay", style: Styles.bigTitleStyle.copyWith(color: Colors.white))),
          )
        ],
      ),
    );
  }
}
