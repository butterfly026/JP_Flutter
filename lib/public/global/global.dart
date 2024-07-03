import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:fpg_flutter/app/controllers/auth_controller.dart';
import 'package:fpg_flutter/app/controllers/global_controller.dart';
import 'package:fpg_flutter/app/pages/main/main_home_controller.dart';
import 'package:fpg_flutter/public/repositories/app_info_repository.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

EventBus eventBus = EventBus();

class Global {
  //用GetIt来管理实例化
  static final getIt = GetIt.instance;
  ApiAppInfoRepository get _appInfoRepository =>
      Global.getIt<ApiAppInfoRepository>();
  static Future<void> init() async {
    //注入全局单例
    getIt.registerSingleton<ApiAppInfoRepository>(ApiAppInfoRepository());
    Get.put<GlobalController>(
      GlobalController(),
    );
    Get.put<MainHomeController>(
      MainHomeController(),
    );
    Get.put<AuthController>(
      AuthController()
    );
  }
}
