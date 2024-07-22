import 'dart:convert';
import 'package:fpg_flutter/public/apis/api_base.dart';
import 'package:fpg_flutter/public/models/base.dart';
import 'package:fpg_flutter/public/network/networking.dart';
import 'package:fpg_flutter/public/tools/logger.dart';

class AppInfo {
  // Define your AppInfo properties and constructor
  bool isOk;

  AppInfo({required this.isOk});

  factory AppInfo.fromJson(Map<String, dynamic> json) {
    return AppInfo(
      isOk: json['isOk'],
    );
  }
}

class RequestAppInfo extends RequestBase {
  // Define your RequestAppInfo properties and constructor
  String appId;
  String m = 'app_info';

  RequestAppInfo(this.appId) : super({'app_id': appId, 'm': 'app_info'});

  @override
  String get path => 'api.php';
}

class JsonHelper {
  static T fromObject<T>(
      dynamic json, T Function(Map<String, dynamic>) create) {
    return create(json);
  }
}


class AppApi extends ApiBase {
  factory AppApi() => _sharedInstance();

  AppApi._() {
    _internal();
  }

  static AppApi get instance => _instance;
  static final AppApi _instance = AppApi._();

  static AppApi _sharedInstance() {
    return _instance;
  }

  void _internal() {
    name = 'AppApi';
    domain = 'http://appapi.fhpro.cc/';
    options = NetworkingOptions();
    options.needLog = true;
  }
  // Singleton block end.

  Future<Map<dynamic, dynamic>?> getAppInfo(String appId) async {
    final request = RequestAppInfo(appId);
    options.tag = buildTag('getAppInfo'); //设置一个日志信息的 tag: AppApi:getAppInfo;

    //请求app_info
    final result = await Networking.get(domain, request, options);
    if (result is ResponseError) {
      return null;
    }
    //将请求结果转换为AppInfo对象
    final response = result;
    if (response['code'] != 1) {
      Logger.warn('NG: ${jsonEncode(response)}', options.tag);
      return null;
    }
    return response;
  }
}
