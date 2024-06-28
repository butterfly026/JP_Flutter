import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/apis/api_notices.dart';
import 'package:fpg_flutter/public/models/bottom_nav_model.dart';
import 'package:fpg_flutter/public/global/global.dart';
import 'package:fpg_flutter/public/repositories/app_info_repository.dart';
import 'package:fpg_flutter/app/pages/account/account_view.dart';
import 'package:fpg_flutter/app/pages/chat_room/chat_room_page.dart';
import 'package:fpg_flutter/app/pages/chess/chess_card_view.dart';
import 'package:fpg_flutter/app/pages/home/home_view.dart';
import 'package:fpg_flutter/app/pages/hunting/hunting_view.dart';
import 'package:fpg_flutter/app/pages/information/Information_view.dart';
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
  List<BottomNavModel> bottomNavs = [
    BottomNavModel(name: "依頼管理", icon: 'tab_business'),
    BottomNavModel(
      name: "チャット",
      icon: 'tab_chat',
    ),
    BottomNavModel(name: "報酬", icon: 'tab_credit'),
    BottomNavModel(name: "マイページ", icon: 'tab_profile'),
  ];
  var currentIndex = 0.obs;
  final activeIndex = 0.obs;

  @override
  void onReady() async {
    super.onReady();
  }

  Widget getCurrentPage() {
    switch (activeIndex.value) {
      case 0:
        return HomeView();
      case 1:
        return HuntingView();
      case 2:
        return InformationView();
      case 3:
        return SizedBox();
      case 4:
        return ChessCardView();
      case 5:
        return ChatRoomPage();
      default:
        return AccountView();
    }
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
