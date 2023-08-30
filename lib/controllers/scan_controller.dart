import 'package:converter/screens/result_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class ScanController extends GetxController {
  bool textScanning = false;
  XFile? imageFile;
  final scannedText = "".obs;
  void getImage(ImageSource source) async {
    try {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);

      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        Get.back();
        Get.to(const ResultPage());
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText.value = "Error occured while scanning";
      EasyLoading.dismiss();
    }
  }

  void getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textDetector();
    RecognisedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText.value = "";
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        scannedText.value = "${scannedText + line.text}\n";
      }
    }
    textScanning = false;
    EasyLoading.dismiss();
  }
}
