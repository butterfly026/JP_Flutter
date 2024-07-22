// ResponseObject class
class ResponseObject<T> {
  String? cookieStr;
  String? message;
  int code;
  String msg;
  T data;
  dynamic info;
  ResponseExtra? extra;

  ResponseObject({
    this.cookieStr,
    this.message,
    required this.code,
    required this.msg,
    required this.data,
    this.info,
    this.extra,
  });
}

// ResponseExtra class
class ResponseExtra {
  int? status;

  ResponseExtra({
    this.status,
  });
}

// ErrorObject class
class ErrorObject {
  String? cookesStr;
  String? url;
  Map<String, dynamic>? params;
  int code;
  String? message;
  dynamic res;

  ErrorObject({
    this.cookesStr,
    this.url,
    this.params,
    this.code = 0,
    this.message,
    this.res,
  }) ;
}

// CCSessionModel class
class CCSessionModel<T> {
  final String? url;
  Map<String, dynamic>? params;
  Map<String, dynamic>? cipherParams;
  ResponseObject<T>? res;
  ErrorObject? err;
  int? status;
  Future<ResponseObject<T>>? promise;
  String? deviceId;
  String? statusText;
  Future<ResponseObject<T>>? noCatchPromise;
  int duration = 0;
  DateTime? startTime;
  String? uniKey;

  Function(ResponseObject<T>? res, ErrorObject? err, CCSessionModel<T> sm)? completion;
  Function(ResponseObject<T>? res, CCSessionModel<T> sm)? success;
  Function(ErrorObject err, CCSessionModel<T> sm)? failure;

  CCSessionModel({
    this.url,
    this.params,
    this.cipherParams,
    this.res,
    this.err,
    this.status,
    this.promise,
    this.deviceId,
    this.statusText,
    this.noCatchPromise,
    this.duration = 0,
    this.startTime,
    this.uniKey,
  });

  CCSessionModel<T> useCompletion(
    void Function(ResponseObject<T>? res, ErrorObject? err, CCSessionModel<T> sm) completion,
  ) {
    this.completion = completion;
    return this;
  }

  CCSessionModel<T> useSuccess(
    void Function(ResponseObject<T>? res, CCSessionModel<T> sm) success,
  ) {
    this.success = success;
    return this;
  }

  CCSessionModel<T> useFailure(
    void Function(ErrorObject err, CCSessionModel<T> sm) failure,
  ) {
    this.failure = failure;
    return this;
  }

  // Setter for noShowErrorHUD
  set noShowErrorHUD(bool value) {
    _noShowErrorHUD = value;
  }

  set setParmas(Map<String, dynamic> val) {
    params = val;
  }

  // Getter for noShowErrorHUD
  bool get noShowErrorHUD => _noShowErrorHUD ?? false;

  bool? _noShowErrorHUD;

  // Static method to get params
  static Future<Map<String, dynamic>> getParams(Map<String, dynamic> p) async {
    for (var k in p.keys.toList()) {
      var v = p[k];
      if (v is Future) {
        p[k] = await v;
      }
      if (v is Function) {
        p[k] = await v();
      }
    }
    return p;
  }
}

void main() {
  // Example usage
  // var model = CCSessionModel<String>(
  //   url: 'https://example.com/api',
  //   params: {'param1': 'value1'},
  //   cipherParams: {'secret': 'abcdef'},
  //   uniKey: 'uniqueKey123',
  // );

  // Example asynchronous method call using static method
  CCSessionModel.getParams({'asyncParam': () => Future.value('asyncValue')}).then((params) {
    // print('Async params: $params');
  }).catchError((error) {
    // print('Error fetching async params: $error');
  });
}
