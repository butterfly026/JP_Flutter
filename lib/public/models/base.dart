import 'dart:convert';

class RequestBase {
  Map<String, dynamic> _properties = {};

  RequestBase(this._properties);

  String get path {
    return '';
  }

  String get queries {
    return _properties.entries
        .map((entry) => '${entry.key}=${entry.value}')
        .join('&');
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'path': path,
      'queries': queries,
      'body': body
    };
    _properties.entries.map((entry) => {
      data[entry.key] = entry.value
    });
    return data;
  }

  Map<String, dynamic> get body {
    return _properties;
  }
}

class ResponseBase {
  String? url;
  int? used;
  Map<String, dynamic>? data;

  ResponseBase({this.url, this.used, this.data});

  factory ResponseBase.fromJson(Map<String, dynamic> json) {
    return ResponseBase(
      url: json['url'],
      used: json['used'],
      data: json,
    );
  }

  bool get isOk {
    return false;
  }
}

class ResponseError extends ResponseBase {
  String? code;
  String? message;
  dynamic payload;

  ResponseError({
    String? url,
    int? used,
    this.code,
    this.message,
    this.payload,
  }) : super(url: url, used: used);
}
