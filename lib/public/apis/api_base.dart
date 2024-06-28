
import 'package:fpg_flutter/public/network/networking.dart';
import 'package:fpg_flutter/public/tools/logger.dart';

class ApiBase {
  // name getter and setter
  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
  }

  // domain getter and setter
  String _domain = '';
  String get domain => _domain;
  set domain(String value) {
    _domain = value;
  }
  // options getter and setter
  NetworkingOptions _options = NetworkingOptions();
  NetworkingOptions get options => _options;
  set options(NetworkingOptions value) {
    _options = value;
  }

  // build tag for logging
  String buildTag(String method) {
    return Logger.callerTag(name, method);
  }
}
