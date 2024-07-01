import 'package:flutter/material.dart';
import 'package:fpg_flutter/app/pages/business/request_list.dart';
import 'package:fpg_flutter/app/pages/account/profile_page.dart';
import 'package:fpg_flutter/app/pages/cards/cards.dart';
import 'package:fpg_flutter/app/pages/chat_room/chat_room_page.dart';
import 'package:fpg_flutter/app/pages/hunting/hunting_view.dart';
import 'package:fpg_flutter/app/pages/information/Information_view.dart';
import 'package:fpg_flutter/public/widgets/bottom_navigation_bar/bottom_tab_model.dart';
import 'package:get/get.dart';

class MyNavModel {
  static final Map<String, MyNavModel> urls = {};
  final IconData icon;
  final String name, url;
  final GetPageBuilder page;
  MyNavModel(this.name, this.icon, this.url, this.page) {
    urls[url] = this;
  }
}

class MainHomeController extends GetxController {
  static MainHomeController get to => Get.find();
  RxList<BottomTabModel> bottomNavs = RxList([
    BottomTabModel(name: "依頼管理", icon: 'tab_business'),
    BottomTabModel(
      name: "チャット",
      icon: 'tab_chat',
    ),
    BottomTabModel(name: "報酬", icon: 'tab_credit'),
    BottomTabModel(name: "マイページ", icon: 'tab_profile'),
  ]);
  var currentTabIndex = 0.obs;

  @override
  void onReady() async {
    super.onReady();
  }

  Widget getCurrentPage() {
    switch (currentTabIndex.value) {
      case 0:
        return const RequestListPage();
      case 1:
        return ChatRoomPage();
      case 2:
        return CardsPage();      
      case 3:
        return ProfilePage();
      default:
        return ProfilePage();
    }
  }

  void changeIndex(int index) {
    currentTabIndex.value = index;
  }
}
