import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:converter/models/saved_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeController extends GetxController {
  final reference = FirebaseFirestore.instance.collection(Hive.box("name").get("name"));
  final dataList = <SavedModel>[].obs;

  @override
  void onInit() {
    getData();
    EasyLoading.dismiss();
    super.onInit();
  }

  Future<void> getData() async {
    final querySnapshot = await reference.get();
    dataList.value = querySnapshot.docs.map((doc) => SavedModel.fromMap(doc.data())).toList();
  }
}
