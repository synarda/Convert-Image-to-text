import 'dart:io';

import 'package:converter/controllers/result_controller.dart';
import 'package:converter/controllers/scan_controller.dart';
import 'package:converter/screens/back_alert_page.dart';
import 'package:converter/screens/zoom_page.dart';
import 'package:converter/utils/const.dart';
import 'package:converter/widgets/bubble_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScanController());
    final controllerResult = Get.put(ResultController());

    return WillPopScope(
      onWillPop: () async {
        final result = await Get.dialog(const BackAlert(txt: "you will quit from the room."));
        if (result == "yes") {
          Get.back();
        }
        return false;
      },
      child: BubbleWrapper(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colorss.forebackground,
            leading: IconButton(
                onPressed: () async {
                  final result = await Get.dialog(const BackAlert(txt: "you didn't save the converted text."));
                  if (result == "yes") {
                    Get.back();
                  }
                },
                icon: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                )),
            leadingWidth: null,
            elevation: 0,
            centerTitle: true,
            title: Text("Result", style: Styles.bigTitleStyle),
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
                  child: controller.imageFile != null
                      ? GestureDetector(
                          onTap: () => Get.dialog(ZoomPage(path: controller.imageFile!.path)),
                          child: SizedBox(
                              height: 200,
                              width: Get.width,
                              child: Stack(
                                children: [
                                  Center(child: Image.file(File(controller.imageFile!.path))),
                                  Center(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(100)),
                                      child: const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              )))
                      : const SizedBox(
                          height: 200,
                          width: 200,
                        ),
                ),
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
            Obx(() => Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    scrollDirection: Axis.vertical,
                    child: Text(
                      controller.scannedText.value,
                      style: Styles.smallTextStyle,
                    ),
                  ),
                ))
          ]),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            height: 60,
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: FloatingActionButton(
                backgroundColor: Colorss.themeNeon1,
                onPressed: () => controllerResult.save(controller.imageFile!.path, controller.scannedText.value),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.save, color: Colors.white),
                    const SizedBox(width: 16),
                    Text("Save", style: Styles.mediumTextStyle.copyWith(color: Colors.white))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
