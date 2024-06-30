import 'package:fpg_flutter/public/define/appDefine.dart';

class RequestInfo {
  // ignore: constant_identifier_names
  static const SECTION_TITLE = 0;
  // ignore: constant_identifier_names
  static const SUB_TITLE = 1;
  
  static dynamic requestInfoAttributes = {
    'accepting' : {
      'gender': {
        'label': '性別',
        'type': AppDefine.WIDGET_LABEL,
      },
      'address': {
        'label': '住所',
        'type': AppDefine.WIDGET_LABEL,
      },
      'request_details': {
        'label': '依頼内容',
        'type': AppDefine.WIDGET_LABEL,
      },
    }
  };
}
