import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/apis/api_notices.dart';
import 'package:fpg_flutter/public/global/global.dart';
import 'package:fpg_flutter/public/repositories/app_info_repository.dart';
import 'package:fpg_flutter/app/pages/account/account_view.dart';
import 'package:fpg_flutter/app/pages/chat_room/chat_room_page.dart';
import 'package:fpg_flutter/app/pages/chess/chess_card_view.dart';
import 'package:fpg_flutter/app/pages/home/home_view.dart';
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
        return HomeView();
      case 1:
        return HuntingView();
      case 2:
        return InformationView();      
      case 3:
        return ChessCardView();
      case 4:
        return ChatRoomPage();
      default:
        return AccountView();
    }
  }

  void changeIndex(int index) {
    currentTabIndex.value = index;
  }
}
