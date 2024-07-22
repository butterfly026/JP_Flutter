

// 用于全局项目提效的方法
import 'dart:convert';
import 'dart:math';

// ignore: depend_on_referenced_packages
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/router/router.dart';
import 'package:fpg_flutter/public/widgets/loading_chasing_dots.dart';
import 'package:get/get.dart';

import '../../utils/cache.dart';

class AppTool{
  /// 适用于多个被逗号隔开的字符串
  static String getFirstStr(String data) {
    String result = '';
    if (data.isNotEmpty && data.contains(",")) {
      result = data.split(",")[0];
    }
    return result;
  }

  static bool isEmpty(String? str){
    if (str != null && str.isNotEmpty ) {
      return false;
    }
    return true;
  }

  static bool isNotEmpty(String? str){
    if (str != null && str.isNotEmpty ) {
      return true;
    }
    return false;
  }

  //避免url太长，截取一部分作为logic的tag
  static String getLogicTag(String url) {
    if (url.isEmpty) {
      return '';
    }
    if (url.length > 31) {
      return url.substring(0, 30);
    } else if (url.length > 21) {
      return url.substring(0, 20);
    }
    return url;
  }

  static String md5RandomStr() {
    final ranNum = Random().nextDouble();
    final randomStr = md5.convert(utf8.encode(ranNum.toString())).toString();
    return randomStr;
  }

  static Widget buildLoadingAnimation() {
    return const LoadingChasingDots(
        color: Color(0xFFFF0000), color2: Color(0xFFFF9900));
  }

  
  static String replaceUrlPlaceholder(String origin) {
    var url = origin;
    Cache.getInstance();
    // if (url.contains('{tenantId}') && cache.userInfo != null) {
    //   url = url.replaceAll('{tenantId}', cache.userInfo!.tenantId);
    // }
    // if (url.contains('{userId}') && cache.userInfo != null) {
    //   url = url.replaceAll('{userId}', cache.userInfo!.userId);
    // }
    // if (url.contains('{deviceId}') && cache.userInfo != null) {
    //   url = url.replaceAll('{deviceId}', cache.userInfo!.deviceId);
    // }
    // if (url.contains('{token}') && cache.token != null) {
    //   url = url.replaceAll('{token}', cache.token!);
    // }
    // if (url.contains('{clientId}')) {
    //   url = url.replaceAll('{clientId}', AppUtil.getClientByPlatform());
    // }
    return url;
  }

  
  //去内置浏览器
  static void toAppWebPage(String url) {
    Get.toNamed(
      AppRouter.webPage,
      parameters: {'url': url},
    );
  }

}