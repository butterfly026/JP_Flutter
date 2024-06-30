import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'dart:io';

import 'package:fpg_flutter/public/config/key_config.dart'; // Correct import for platform checks


class AppDefine {
  static String host = '';
  // ignore: non_constant_identifier_names
  static int TAB_BUSINESS_INDEX = 0;
  // ignore: non_constant_identifier_names
  static int TAB_CHAT_INDEX = 1;
  // ignore: non_constant_identifier_names
  static int TAB_CREDIT_INDEX = 2;
  // ignore: non_constant_identifier_names
  static int TAB_PROFILE_INDEX = 3;

  //Define about widget type
  static String WIDGET_LABEL = 'Label';
  static String WIDGET_RICH_TEXT = 'RichText';
  static String WIDGET_LIST_CHECKBOX = 'ListCheckbox';

}
