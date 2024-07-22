import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fpg_flutter/utils/device.dart';
import 'package:http/http.dart' as http;

import '../config/multi_domain_urls.dart';
import '../tools/rsa_encrypt.dart';

const List<String> appInfoUrl = [
  'https://appapi.coin-ken.com/api.php',
  'https://appapi.doy-coin.net/api.php',
  'https://appapi.hguavideo.com/api.php',
  'https://appapi.itokenweb.com/api.php',
]; //域名服务器

class ApiAppInfo {
  // 得到站点对应的域名
  static Future<void> appDomain({
    String? siteId,
    Function(List<String>? urls, List<String>? checkingUrls)? domainCallback,
  }) async {
    final appId = siteIds[siteId];

    if (appId == null) {
      if (Platform.isIOS) {
        domainCallback?.call(null, null);
      }
      return;
    }

    final isCheck = await _getIsCheck();
    final sign = encryptRsa(jsonEncode({
      "app_id": appId,
      "m": "app_info"
    })); // Manually constructed as JSON.stringify output order differs

    final data = {
      'm': 'app_info',
      'app_id': appId,
      'sign': sign,
    };

    List<String>? curDomain;
    for (final url in appInfoUrl) {
      try {
        final response = await http.post(
          Uri.parse(url),
          body: data,
        );
        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);
          final appInfo = responseData['data'];
          final newDomain = isCheck ? appInfo.checkPackageDomains : appInfo.packageDomains;
          if (curDomain == null && newDomain != null) {
            curDomain = newDomain;
            // UGStore.dispatch({
            //   'type': 'reset',
            //   'allDomains': curDomain,
            // });
            domainCallback?.call(curDomain, appInfo.checkPackageDomains);
          }
        }
      // ignore: empty_catches
      } catch (error) {
      }
    }
  }

  // 是否使用审核中的域名
  static Future<bool> _getIsCheck() async {
    if (DeviceUtil.isIOS) {
      try {
        final result = await MethodChannel('com.example.app/ocHelper')
            .invokeMethod<bool>('isCheckDomain');
        return result ?? false;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    return false;
  }
}
