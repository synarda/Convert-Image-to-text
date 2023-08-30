// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:converter/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/const.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({
    Key? key,
    required this.path,
    required this.txt,
  }) : super(key: key);
  final String path;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DetailPage(txt: txt, path: path)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        height: 100,
        width: Get.width,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colorss.forebackground),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(height: 80, width: 80, child: Image.file(File(path), fit: BoxFit.cover)),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(txt,
                style: Styles.smallTextStyle.copyWith(fontSize: 6), overflow: TextOverflow.ellipsis, maxLines: 10),
          ),
          const Icon(Icons.arrow_forward_ios_outlined, color: Colorss.backgroundColor)
        ]),
      ),
    );
  }
}
