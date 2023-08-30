import 'package:converter/controllers/home_controller.dart';
import 'package:converter/screens/choose_page.dart';
import 'package:converter/utils/const.dart';
import 'package:converter/widgets/animated_listview.dart';
import 'package:converter/widgets/bubble_wrapper.dart';
import 'package:converter/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = Hive.box("name").get("name");
    final controller = Get.put(HomeController());
    return BubbleWrapper(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              IconButton(
                  onPressed: Get.back,
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white.withOpacity(0.5),
                  )),
              const Spacer(),
              Text(name.toUpperCase(), style: Styles.mediumTextStyle),
              const Spacer()
            ],
          ),
          Obx(
            () => Expanded(
              child: controller.dataList.isNotEmpty
                  ? AnimatedListView(
                      reverse: false,
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      children: controller.dataList
                          .map((e) => ListItemWidget(
                                key: ValueKey(e.uid),
                                path: e.path,
                                txt: e.text,
                              ))
                          .toList(),
                    )
                  : SizedBox(
                      width: Get.width,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100), color: Colorss.textColor.withOpacity(0.2)),
                            child: Lottie.asset("assets/json/blank.json", height: 100, width: 100, fit: BoxFit.cover)),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Text("there is no convert registered yet.",
                              style: Styles.smallTextStyle.copyWith(color: Colors.white.withOpacity(0.4))),
                        ),
                      ]),
                    ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 60,
        width: Get.width,
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: FloatingActionButton(
          backgroundColor: Colorss.themeNeon1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () => Get.bottomSheet(const ChoosePage()),
          child:
              Text("Scan", style: Styles.bigTitleStyle.copyWith(color: Colors.white)).animate(onComplete: (controller) {
            controller.forward(from: 0);
          }).shimmer(delay: 1500.ms, color: Colors.white.withOpacity(0.5), duration: 1000.ms),
        ),
      ),
    ));
  }
}
