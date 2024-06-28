import 'package:flutter/foundation.dart';

const bool B_DEBUG = true; // Set to true for debug, false for production

void ugLog(dynamic first, [dynamic second, dynamic third, List<dynamic> rest = const []]) {
  if (B_DEBUG) {
    List<dynamic> allArgs = [first, if (second != null) second, if (third != null) third, ...rest];
    debugPrint('[Log] ${allArgs.join(' ')}');
  }
}


// Error log function
void ugError(List<dynamic> s) {
  if (B_DEBUG) {
    debugPrint('[Error] ${s.join(' ')}');
  }
}