
import 'package:fpg_flutter/public/network/networking.dart';
import 'package:fpg_flutter/public/tools/logger.dart';

class ApiBase {
  // name getter and setter
  String name = '';

  // domain getter and setter
  String domain = '';
  // options getter and setter
  NetworkingOptions options = NetworkingOptions();

  // build tag for logging
  String buildTag(String method) {
    return Logger.callerTag(name, method);
  }
}
