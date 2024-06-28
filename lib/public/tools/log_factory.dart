import 'dart:convert';

// Mocked utility function, assuming similar functionality.
bool isJsonString(String str) {
  try {
    json.decode(str);
    return true;
  } catch (e) {
    return false;
  }
}

class LogFactory {
  Log create(String log) {
    if (isJsonString(log)) {
      final logObject = json.decode(log);
      if (logObject['status'] != null ||
          logObject['statusCode'] != null ||
          logObject['description'] != null) {
        return RequestLog(log);
      }
    }
    return CommonLog(log);
  }
}

class Log {
  final String _message;

  Log(this._message);

  String content() {
    return '';
  }
}

class CommonLog extends Log {
  CommonLog(String message) : super(message);

  @override
  String toString() {
    return '--- 讯息：$_message\n';
  }
}

class RequestLog extends Log {
  RequestLog(String message) : super(message);

  @override
  String toString() {
    final logObject = json.decode(_message);
    final statusCode = logObject['status'] ?? logObject['statusCode'] ?? logObject['description'] ?? null;

    return '${statusCode != null ? '--- 网络响应：$statusCode\n' : ''}'
           '--- 请求路径：${logObject['url'] ?? ''}\n';
  }

  @override
  String content() {
    return json.encode(this);
  }
}
