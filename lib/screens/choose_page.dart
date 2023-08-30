import 'package:converter/controllers/scan_controller.dart';
import 'package:converter/utils/const.dart';
import 'package:converter/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScanController());

    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colorss.backgroundColor),
      child: Column(children: [
        const Divider(
          color: Colorss.textColor,
          endIndent: 150,
          indent: 150,
          height: 30,
          thickness: 5,
        ),
        ButtonsWidget(
          icon: const Icon(Icons.photo, color: Colors.white),
          txt: "Gallery",
          function: () => controller.getImage(ImageSource.gallery),
        ),
        ButtonsWidget(
          icon: const Icon(Icons.camera, color: Colors.white),
          txt: "Camera",
          function: () => controller.getImage(ImageSource.camera),
        ),
      ]),
    );
  }
}
