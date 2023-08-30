import 'package:converter/screens/recognize_page.dart';
import 'package:converter/utils/const.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("name");
  await Firebase.initializeApp();
  runApp(const MyApp());
  load();
}

void load() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.chasingDots
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 70.0
    ..radius = 10.0
    ..progressColor = Colorss.themeNeon1
    ..backgroundColor = Colors.black
    ..indicatorColor = Colorss.themeNeon1
    ..textColor = Colorss.textColor
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const RecognizePage(),
      builder: (ctx, child) {
        return FlutterEasyLoading(child: child);
      },
    );
  }
}
