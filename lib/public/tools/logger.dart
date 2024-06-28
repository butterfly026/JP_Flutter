import 'dart:convert';

import 'package:fpg_flutter/public/tools/log_factory.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

enum LogType {
  Trace,
  Debug,
  Info,
  Warn,
  Error,
  Fatal,
}

class LoggerFlags {
  bool trace = false;
  bool debug = false;
  bool info = false;
  bool warn = false;
  bool error = false;
  bool fatal = false;

  void setup(String level) {
    List<String> flags = level.toLowerCase().split(',');
    trace = flags.contains('trace');
    debug = flags.contains('debug');
    info = flags.contains('info');
    warn = flags.contains('warn');
    error = flags.contains('error');
    fatal = flags.contains('fatal');
  }

  bool needLog(LogType type) {
    switch (type) {
      case LogType.Trace:
        return trace;
      case LogType.Debug:
        return debug;
      case LogType.Info:
        return info;
      case LogType.Warn:
        return warn;
      case LogType.Error:
        return error;
      case LogType.Fatal:
        return fatal;
      default:
        return false;
    }
  }
}

class LoggerOptions {
  String id = '';
  String location = '';
  String name = '';
  String site = '';
  String userAgent = '';
  String version = '';
}

class Logger {
  // Singleton block begin.
  static final Logger _instance = Logger._internal();
  factory Logger() {
    return _instance;
  }
  Logger._internal();
  // Singleton block end.

  // flags getter
  final LoggerFlags _flags = LoggerFlags();
  LoggerFlags get flags => _flags;

  // options getter
  final LoggerOptions _options = LoggerOptions();
  LoggerOptions get options => _options;

  // // factory getter
  final LogFactory _factory = LogFactory();
  LogFactory get factory => _factory;

  /// trace entry
  static void trace(String message, String tag) {
    Logger()._log(LogType.Trace, message, tag);
  }

  /// debug entry
  static void debug(String message, String tag) {
    Logger()._log(LogType.Debug, message, tag);
  }

  /// info entry
  static void info(String message, String tag) {
    Logger()._log(LogType.Info, message, tag);
  }

  /// warn entry
  static void warn(String message, String tag) {
    Logger()._log(LogType.Warn, message, tag);
  }

  /// error entry
  static void error(String message, String tag) {
    Logger()._log(LogType.Error, message, tag);
  }

  /// fatal entry
  static void fatal(String message, String tag) {
    Logger()._log(LogType.Fatal, message, tag);
  }

  // format caller tag for logging
  static String callerTag(String className, String methodName) {
    return '$className:$methodName';
  }

  /// log with type, message and tag
  Future<bool> _log(LogType type, String message, String tag) async {
    final log = _factory.create(message);
    final text = '--- ${options.name} '
        '--- 请求 ${options.site} 站点域名 '
        '--- ${type.toString().split('.').last} - $tag\n'
        '--- 用戶位址：${options.location}\n'
        '--- 日期：${DateFormat('yyyy/MM/ddTHH:mm:ss.SSS [Z] A').format(DateTime.now())} '
        '--- Version：${options.version}\n'
        '--- UserAgent：${options.userAgent}\n'
        '${log.toString()}'
        '--- 相关参数：${jsonEncode({
          'usr': options.id,
          'content': log.content,
        })}';
    print('[$type] $tag: $text');

    if (!_isDev && flags.needLog(type)) {
      return true; //(await LogApi.instance.sendLog(Uri.encodeComponent(text))) != null;
    }
    return true;
  }

  // log api call
  static void api(String message, {LogType logType = LogType.Error}) {
    Logger()._api(message, logType);
  }

  Future<bool> _api(String message, LogType logType) async {
    final text = 'Site: ${options.site}, Ver: ${options.version}, IP: ${options.location}\n'
        '$message';

    if (!_isDev && flags.needLog(logType)) {
      return  true; //(await LogApi.instance.sendLog(Uri.encodeComponent(text))) != null;
    }
    return true;
  }
}

class Log {
  final String content;

  Log({required this.content});

  @override
  String toString() {
    return content;
  }
}

class TGLogBuilder {
  final Map<String, Map<String, dynamic>> tgLog = {};
  final int maxLength = 3096; //Telegram最高上限4096，這邊抓1000buffer給其他資訊
  final String initialText;

  TGLogBuilder(this.initialText);

  TGLogBuilder append(String header, String content) {
    tgLog[header] = {'content': content};
    return this;
  }

  TGLogBuilder appendNewLine(String header, String content, {bool isNecessary = false}) {
    tgLog[header] = {'content': content, 'isNewLine': true, 'isNecessary': isNecessary};
    return this;
  }

  bool _isTooLarge(dynamic content, String key) {
    if (content == null) {
      return false;
    }
    if (content is num) {
      return content.toString().length > maxLength;
    }
    return content.length > maxLength;
  }

  String build() {
    String exportLog = initialText;
    String exportNecessaryLog = initialText;
    tgLog.forEach((key, log) {
      exportLog += log['isNewLine'] == true
          ? '\n---$key：${_isTooLarge(log['content'], key) ? '超出上限' : log['content']}'
          : ', $key：${_isTooLarge(log['content'], key) ? '超出上限' : log['content']}';
      if (log['isNecessary'] == true) {
        exportNecessaryLog += log['isNewLine'] == true
            ? '\n---$key：${_isTooLarge(log['content'], key) ? '超出上限' : log['content']}'
            : ', $key：${_isTooLarge(log['content'], key) ? '超出上限' : log['content']}';
      }
    });
    if (exportLog.length >= maxLength) {
      print('超過字數: ${exportLog.length}');
      return '(必要)$exportNecessaryLog';
    }
    return exportLog;
  }
}

const bool _isDev = true; // Change this flag based on your environment (dev or production)
