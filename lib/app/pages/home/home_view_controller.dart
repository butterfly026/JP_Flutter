import 'package:fpg_flutter/public/apis/api_game.dart';
import 'package:fpg_flutter/public/apis/api_system.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeViewController extends GetxController {
  static HomeViewController get to => Get.find();
  RxInt selectedTabIndex = 0.obs;
  RxList<String> homeAds = RxList();
  RxList<String> banners = RxList();
  RxList<dynamic> homeGames = RxList();
  String notice = '';
  
  @override
  void onReady() async {
    super.onReady();
    // _getHomeInfos();
  }

  // Future<void> _getHomeInfos() async {
  //   Map<String, dynamic> result = await ApiSystem.homeAds();
  //   List<dynamic> homeAdInfos = result['data'];
  //   for (dynamic info in homeAdInfos) {
  //     if (info['image'] != null) {
  //       homeAds.add(info['image']);
  //     }
  //   }

  //   result = await ApiSystem.banners();
  //   List<dynamic> bannerInfos = result['data']['list'];
  //   for (dynamic info in bannerInfos) {
  //     if (info['pic'] != null) {
  //       banners.add(info['pic']);
  //     }
  //   }

  //   result = await ApiSystem.notices();
  //   List<dynamic> noticeInfos = result['data']['scroll'];
  //   noticeInfos.asMap().forEach((index, info) {
  //     if (info['content'] != null) {
  //       if (index == noticeInfos.length - 1) {
  //         notice += info['content'];
  //       } else {
  //         notice += info['content'] +
  //             '<div class="fgx" style="border: 1px dashed #9a9898;margin-bottom: 10px;"></div>';
  //       }
  //     }
  //   });
  //   result = await ApiGame.homeGames();
  //   List<dynamic> games = result['data']['navs'] ?? [];
  //   for (var game in games) {
  //     if (game['sort'] is String) {
  //       game['sort'] = int.tryParse(game['sort']) ??
  //           0; // Convert to int or default to 0 if conversion fails
  //     } else if (game['sort'] == null) {
  //       game['sort'] = 0; // Default to 0 if sort is null
  //     }
  //   }
  //   games.sort((a, b) => (a['sort'] as int).compareTo(b['sort'] as int));
  //   homeGames.value = List<Map<String, dynamic>>.from(games);
  // }
}
