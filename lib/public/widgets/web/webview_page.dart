import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fpg_flutter/public/event/android_webview_redirect_event.dart';
import 'package:fpg_flutter/public/global/global.dart';
import 'package:fpg_flutter/public/tools/app_tool.dart';
import 'package:fpg_flutter/public/widgets/app_bar.dart';
import 'package:fpg_flutter/public/widgets/web/webview_option.dart';
import 'package:fpg_flutter/utils/device.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'android_ios_webview.dart';
import 'web_logic.dart';

//内置浏览器页
class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<StatefulWidget> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  String? title;
  String url = '';
  late WebViewController controller;
  late WebLogic webLogic;
  late String tag;
  final androidIosKey = GlobalKey<AndroidIosWebViewState>();
  late WebViewOption option;
  late final StreamSubscription androidWebViewRedirectSubscription;

  double progress = 0.0; // State variable to track progress

  @override
  void initState() {
    super.initState();
    title = Get.parameters['title'] ?? '';
    url = Get.parameters['url'] ?? '';
    if (AppTool.isEmpty(url)) {
      tag = AppTool.md5RandomStr();
    } else {
      tag = AppTool.getLogicTag(url);
    }
    webLogic = Get.put(WebLogic(), tag: tag);
    option = WebViewOption();
    option.getTitle = true;
    androidWebViewRedirectSubscription =
        eventBus.on<AndroidWebViewRedirectEvent>().listen((event) {
      if (context.mounted) {
        Get.back();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    androidWebViewRedirectSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      String title = webLogic.title.value;
      return Scaffold(
        appBar: SubPageAppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          titleText: title,
          actions: [
            IconButton(
              onPressed: () {
                _reload();
              },
              icon: const Icon(Icons.refresh_rounded, size: 25),
            ),
          ],
        ),
        body: Column(
          children: [
            if(progress < 1) 
              LinearProgressIndicator(value: progress),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse(url)),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(),
                ),
                onProgressChanged: (controller, newProgress) {
                  
                        // print(newProgress);
                  setState(() {
                    progress =
                        newProgress / 100; 
                  });
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  _reload() {
    if (DeviceUtil.isWeb) {
      // Handle web reload logic if needed
    } else {
      androidIosKey.currentState?.reload();
    }
  }
}
