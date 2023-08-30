// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:converter/screens/zoom_page.dart';
import 'package:converter/utils/const.dart';
import 'package:converter/widgets/bubble_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.txt,
    required this.path,
  }) : super(key: key);
  final String txt;
  final String path;
  @override
  Widget build(BuildContext context) {
    return BubbleWrapper(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colorss.forebackground,
          leading: IconButton(
              onPressed: Get.back,
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              )),
          leadingWidth: null,
          elevation: 0,
          centerTitle: true,
          title: Text("Detail", style: Styles.bigTitleStyle),
        ),
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(" Photo", textAlign: TextAlign.start, style: Styles.bigTitleStyle),
              const Divider(
                color: Colors.white,
              ),
              Container(
                  margin: const EdgeInsets.all(20),
                  child: GestureDetector(
                      onTap: () => Get.dialog(ZoomPage(path: path)),
                      child: SizedBox(
                          height: 200,
                          width: Get.width,
                          child: Stack(
                            children: [
                              Center(child: Image.file(File(path))),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.5), borderRadius: BorderRadius.circular(100)),
                                  child: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )))),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(" Converted Text", textAlign: TextAlign.start, style: Styles.bigTitleStyle),
              const Divider(
                color: Colors.white,
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.vertical,
              child: Text(
                txt,
                style: Styles.smallTextStyle,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
