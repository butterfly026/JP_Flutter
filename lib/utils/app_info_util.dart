

class AppInfoUtils {
  AppInfoUtils._();


  static final AppInfoUtils _instance = AppInfoUtils._();

  static AppInfoUtils get instance => _instance;

  Future<void> fetchAppInfo() async {
    // await _appInfoRepository.fetchAppInfo();
  }

}
