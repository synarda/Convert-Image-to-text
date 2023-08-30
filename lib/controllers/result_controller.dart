import 'package:converter/controllers/home_controller.dart';
import 'package:converter/screens/home_page.dart';
import 'package:converter/services/save_service.dart';
import 'package:converter/utils/alerts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  void save(String path, String text) async {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);

    final result = await InfoService().saveStatus(path, text);
    if (result != null) {
      Alerts.showAlert("Save Text and Photo");
      Get.find<HomeController>().getData();
      Get.off(const HomePage());
      EasyLoading.dismiss();
    }
  }
}
