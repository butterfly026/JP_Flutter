import 'package:flutter/material.dart';
import 'package:fpg_flutter/public/config/dimens.dart';
import 'package:fpg_flutter/public/define/request_info.dart';
import 'package:fpg_flutter/public/widgets/text_info_title.dart';
import 'package:fpg_flutter/utils/theme/app_theme.dart';

class TextSubitleValue extends StatelessWidget {
  final String title;
  final String value;
  final double? marginBottom;
  const TextSubitleValue({super.key, this.title = '', this.value = '', this.marginBottom});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(bottom: Dimens.gap_dp6),
        child: TextInfoTitle(
          title: title,
          type: RequestInfo.SUB_TITLE,
        ),
      ),
      Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: Dimens.gap_dp30),
          margin: EdgeInsets.only(bottom: marginBottom ?? Dimens.gap_dp30),
          child: Text(
            value,
            style: AppTheme.body2,
          ))
    ]);
  }
}
