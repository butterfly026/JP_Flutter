

class ApiAppInfoRepository {
  static String appInfoKey = '@appInfo';
  static String configKey = '@systemConfig';
  static dynamic appInfo;

  // Future<void> _fetchUserAgent() async {
  //   DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   String userAgent;

  //   try {
  //     if (DeviceUtil.isAndroid) {
  //       AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
  //       userAgent = 'AppName/${packageInfo.version} '
  //           '(Linux; Android ${androidInfo.version.release}; ${androidInfo.model})';
  //     } else if (DeviceUtil.isIOS) {
  //       IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
  //       userAgent = 'AppName/${packageInfo.version} '
  //           '(iPhone; CPU iPhone OS ${iosInfo.systemVersion.replaceAll('.', '_')} like Mac OS X)';
  //     } else {
  //       userAgent = 'Unknown platform';
  //     }
  //   } catch (e) {
  //     userAgent = 'Failed to get user agent: $e';
  //   }
  //   AppDefine.userAgent = userAgent;
  // }

  // Future<Map<dynamic, dynamic>?> _fetchLocalAppInfo() async {
  //   try {
  //     return jsonDecode(await Storage.instance.getString(appInfoKey));
  //   } catch (_) {
  //     return null;
  //   }
  // }

  // Future<Map<dynamic, dynamic>?> _fetchRemoteAppInfo() async {
  //   final keyConfig = AppDefine.keyConfig;
  //   if (keyConfig == null) return null;

  //   final response = await AppApi.instance.getAppInfo(keyConfig.appId);
  //   if (response == null) return null;
  //   return response['data'];
  // }

  // Future<void> fetchAppInfo() async {
  //   await Storage.instance.remove(appInfoKey);
  //   dynamic data = await _fetchLocalAppInfo();
  //   if (data != null) {
  //   }
  //   if (data != null) {
  //     appInfo = data;
  //   }
  //   for (var index = 0; index < 5; index++) {
  //     data = await _fetchRemoteAppInfo();
  //     if (data != null) break;
  //   }
  //   await _setAppDefine(data);
  // }

  // List<String> processDomains(List<dynamic> packageDomains, String siteUrl) {
  //   // Combine packageDomains and siteUrl into a single list
  //   List<String> combinedDomains = [...packageDomains, siteUrl];

  //   // Filter out invalid URLs
  //   Set<String> validDomains = combinedDomains
  //       .where((domain) => Networking.isValidUrl(domain))
  //       .toSet();

  //   // Remove the last slash from each valid domain
  //   List<String> processedDomains = validDomains
  //       .map((domain) => CommonUtil().removeLastSlash(domain))
  //       .toList();

  //   return processedDomains;
  // }

  // Future<void> _setAppDefine(info) async {
  //   final domain = await _testSpeed(info);
  //   AppDefine.host = domain;
  //   List<dynamic> dynamicList = info['package_domains'];
  //   List<String> stringList = dynamicList.map((e) => e as String).toList();
  //   AppDefine.domains = stringList;
  // }

  // Future<String> _testSpeed(info) async {
  //   final domains = processDomains(info['package_domains'], info['site_url']);
  //   if (domains.length == 0) {
  //     return CommonUtil().removeLastSlash(info['site_url']);
  //   }
  //   final options = new NetworkingOptions();
  //   options.timeout = 2500;
  //   options.abort = true;
  //   List<String> promises = [];
  //   for (var domain in domains) {
  //     String tmpDomain = domain as String;
  //     Map<String, dynamic> response =
  //         await Networking.get('${tmpDomain}${_serverTime}', null, options);
  //     if (response is! ResponseError) {
  //       promises.add(tmpDomain);
  //     }
  //   }

  //   return promises.isNotEmpty
  //       ? promises[0]
  //       : CommonUtil().removeLastSlash(info['site_url']);
  // }
}
