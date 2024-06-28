import 'package:fpg_flutter/public/global/global.dart';
import 'package:fpg_flutter/public/repositories/app_info_repository.dart';

class AppInfoUtils {
  AppInfoUtils._();


  ApiAppInfoRepository get _appInfoRepository => Global.getIt<ApiAppInfoRepository>();
  static final AppInfoUtils _instance = AppInfoUtils._();

  static AppInfoUtils get instance => _instance;

  Future<void> fetchAppInfo() async {
    // await _appInfoRepository.fetchAppInfo();
  }

}
