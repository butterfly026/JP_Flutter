import 'package:fpg_flutter/app/pages/main/main_home_controller.dart';
import 'package:fpg_flutter/app/pages/main/main_home.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get to => Get.find();

  Future<void> gotoMainPageByUrl(String url) async {
    late MainHomeController controller = MainHomeController.to;
    int index =
        controller.bottomNavs.indexWhere((tab) => tab.url == url);
    index = index == -1 ? 0 : index;
    if (Get.isRegistered<MainHomeController>()) {
      Get.find<MainHomeController>().changeIndex(index);
    } else {
      Get.to(() => MainPage(curIndex: index));
    }
  }

  Future<void> gotoMainPageByIndex(int index) async {
    index = index == -1 ? 0 : index;
    if (Get.isRegistered<MainHomeController>()) {
      Get.find<MainHomeController>().changeIndex(index);
    } else {
      Get.to(() => MainPage(curIndex: index));
    }
  }
}