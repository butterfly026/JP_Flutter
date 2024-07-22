class RequestBase {
  Map<String, dynamic> properties = {};

  RequestBase(this.properties);

  String get path {
    return '';
  }

  String get queries {
    return properties.entries
        .map((entry) => '${entry.key}=${entry.value}')
        .join('&');
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'path': path,
      'queries': queries,
      'body': body
    };
    properties.entries.map((entry) => {
      data[entry.key] = entry.value
    });
    return data;
  }

  Map<String, dynamic> get body {
    return properties;
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
    super.url,
    super.used,
    this.code,
    this.message,
    this.payload,
  });
}
