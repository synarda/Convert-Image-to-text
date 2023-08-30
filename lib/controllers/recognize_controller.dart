import 'package:converter/screens/home_page.dart';
import 'package:converter/utils/alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecognizeController extends GetxController {
  final TextEditingController nameController = TextEditingController();

  @override
  void onInit() {
    final name = Hive.box("name").get("name");
    if (name != null) {
      nameController.text = name;
    }
    super.onInit();
  }

  void saveName() {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
    if (nameController.text.isEmpty) {
      Alerts.showError("Please enter Name");
    } else {
      Hive.box("name").put("name", nameController.text.trim());
      Get.to(const HomePage());
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
