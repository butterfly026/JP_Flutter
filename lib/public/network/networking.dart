import 'dart:convert';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:fpg_flutter/public/apis/app_api.dart';
import 'package:fpg_flutter/public/models/base.dart';
import 'package:fpg_flutter/public/network/http.dart';
import 'package:fpg_flutter/public/tools/logger.dart';
import 'package:http/http.dart' as http;

class NetworkingOptions {
  bool needLog = false;
  Map<String, String> headers = {'Accept-Language': 'zh-cn'};
  String tag = '';
  int timeout = Networking.defaultTimeout;
  bool abort = false;
}

class Networking {
  static const int defaultTimeout = 10000; // 10 seconds
  static const int longTimeout = 30000; // 30 seconds

  // Check if url is valid
  static bool isValidUrl(String url) {
    final urlPattern = RegExp(r'^(ftp|http|https):\/\/[^ "]+$', caseSensitive: false);
    return urlPattern.hasMatch(url);
  }

  static Future<dynamic> get(
      String url, RequestAppInfo? request, NetworkingOptions options) async {
    if (request != null) {
      url = '$url${request.path}?${request.queries}';
    }
    if (options.tag == '') {
      options.tag = 'Networking:get';
    }
    Options reqOptions = Options();
    reqOptions.headers = options.headers;
    Map<String, dynamic> response =
        await httpService.get(url, options: reqOptions);

    if (response['code'] != -1) {
      return response;
    } else {
      return ResponseError(); // You need to define the ResponseError class properly
    }
  }

  static Future<ResponseBase> post(
    String url, {
    RequestBase? request,
    NetworkingOptions? options,
  }) async {
    if (request != null) {
      url = '$url${request.path}';
    }
    options ??= NetworkingOptions();
    if (options.tag.isEmpty) {
      options.tag = Logger.callerTag('Networking', 'post');
    }

    return await _request(
      url,
      http.post(
        Uri.parse(url),
        headers: options.headers,
        body: json.encode(request?.body ?? {}),
      ).timeout(Duration(milliseconds: options.timeout)),
      options,
    );
  }

  static Future<ResponseBase> _request(
    String url,
    Future<http.Response> promise,
    NetworkingOptions options,
  ) async {
    final stopwatch = Stopwatch()..start();

    try {
      final response = await promise;
      stopwatch.stop();

      final data = json.decode(response.body);
      if (options.needLog) {
        Logger.info(
          json.encode({
            'status': response.statusCode,
            'url': url,
            'timeInterval': '${stopwatch.elapsedMilliseconds} ms',
          }),
          options.tag,
        );
      }

      return ResponseBase.fromJson({
        ...data,
        'used': stopwatch.elapsedMilliseconds,
        'url': url,
      });
    } catch (error) {
      stopwatch.stop();
      if (options.needLog) {
        Logger.error(
          json.encode({
            'error': error.toString(),
            'url': url,
            'timeInterval': '${stopwatch.elapsedMilliseconds} ms',
          }),
          options.tag,
        );
      }

      final responseError = ResponseError(
        url: url,
        used: stopwatch.elapsedMilliseconds,
        code: error is TimeoutException ? 'timeout' : 'error',
        message: error.toString(),
        payload: error,
      );
      print('${options.tag}.failure: ${json.encode(error)}');
      return responseError;
    }
  }
}


class Stopwatch {
  late final _stopwatch = Stopwatch();

  void start() => _stopwatch.start();
  void stop() => _stopwatch.stop();

  int get elapsedMilliseconds => _stopwatch.elapsedMilliseconds;
}
